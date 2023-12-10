import 'dart:convert';

import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/disabili/carica_disabili_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class SendDataParentsRepository {

    Future sendDataParents(
        BuildContext context, String nome, String data, String grado) async {
      try {
        var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/familiari';
        // Await the http get response, then decode the json-formatted response.
        var response = await http.post(Uri.parse(url),
            headers: {
              'Accept': 'application/json',
              'Content-type': 'application/json',
              'Authorization': 'Bearer ${globals.tokenValue}'
            },
            body: jsonEncode({
              'nome': nome,
              'data_di_nascita': data,
              'grado': grado,
            }));
        print('statuscodedata ${response.statusCode}');
      
globals.statusCode = response.statusCode;
        switch (response.statusCode) {
          case 200:
           if(context.mounted) {
             Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DisabiliPage()));
           }
            break;
          case 401:
            Navigator.of(context, rootNavigator: true).pushReplacement(
                MaterialPageRoute(builder: (context) => PresentationPage()));

            break;
          case 400:
            String message = 'Utente non trovato';
            Navigator.of(context, rootNavigator: true).pushReplacement(
                MaterialPageRoute(builder: (context) => PresentationPage()));
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )));
            break;
          case 500:
            String message =
                'Errore Server: impossibile stabilire una connessione';
            Navigator.of(context, rootNavigator: true).pushReplacement(
                MaterialPageRoute(builder: (context) => PresentationPage()));
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )));
            break;
          default:
            print('errore generico');
        }

        return response;
      } catch (e) {}
    }
}
