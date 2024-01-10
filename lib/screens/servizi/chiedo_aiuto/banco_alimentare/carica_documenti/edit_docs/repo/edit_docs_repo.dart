import 'dart:convert';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/model/edit_docs_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/model/edit_parents_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class EditDocsRepository {
 Future editDocs(
    BuildContext context,
   String id,
   String nome,
   String dataDiNascita,
   String grado,
  ) async {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/familiari/update/$id';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.put(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body:    jsonEncode({
            'nome': nome,
            'data_di_nascita': dataDiNascita,
            'grado': grado,
          }));
          print('statusc ${response.body}');
      switch (response.statusCode) {
        case 200:
          print('parenti modificati');

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

   
  }












  Future<List<DocsData>> getDocsData(BuildContext context) async {
     var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/list-documents/${globals.userData!.id}';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${globals.tokenValue}'
      },
    );
     final List<dynamic> body = json.decode(response.body);
    var data = body.map((e) => DocsData.fromJson(e)).toList();
      globals.listDocsData = data;
    

    print('docs ${globals.listDocsData}');
   
    switch (response.statusCode) {
      case 200:
      print('success data request');
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
        String message = 'Errore Server: impossibile stabilire una connessione';
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
    return data ;
  }

  
}