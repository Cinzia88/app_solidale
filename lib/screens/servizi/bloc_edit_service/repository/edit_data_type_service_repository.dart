import 'dart:convert';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/form_data_parents/carica_parenti_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/page/disabili/carica_disabili_page_taxi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class EditDataTypeServiceRepository {
 Future<RequestData> editDataTypeservice(
    BuildContext context,
   
  ) async {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/richiesta/show/4';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
         );
    RequestData dataRequest = RequestData.fromJson(jsonDecode(response.body));

      switch (response.statusCode) {
        case 200:
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

      return dataRequest;
   
  }

  Future sendMailService(
    BuildContext context,
    String richiesta,
  ) async {
    try {
      var url =
          '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/request-service/$richiesta';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${globals.tokenValue}'
        },
      );

      switch (response.statusCode) {
        case 200:
          print('richiesta servizio via mail');
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
