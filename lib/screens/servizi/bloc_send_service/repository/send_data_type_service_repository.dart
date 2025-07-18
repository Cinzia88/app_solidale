import 'dart:convert';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/edit_acc_onc/page_edit_acc.onc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/form_data_parents/carica_parenti_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/disabili/carica_disabili_page_taxi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class SendDataTypeServiceRepository {
  Future sendDataTypeservice({
    required BuildContext context,
    required String serviceId,
    String? codiceFamiglia,
    required String nome,
    required String telefono,
    String? partenza,
    String? destinazione,
    String? data,
    String? ora,
  }) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/richiesta';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body: jsonEncode({
            'service_id': serviceId,
            'codice_famiglia': codiceFamiglia,
            'nome': nome,
            'telefono': telefono,
            'partenza': partenza,
            'destinazione': destinazione,
            'data': data,
            'ora': ora,
          }));
      print('response.statusCode ${response.statusCode}');
      switch (response.statusCode) {
        case 200:
          if (response.body.contains('"service_id":1')) {
            if (context.mounted) {
              showDialog(
                  barrierColor: Colors.black87,
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: Image.asset(PathConstants.offroAiuto),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Grazie per il tuo prezioso contributo. ',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      content: const Text('Ti contatteremo al più presto!'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      actions: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PresentationPage()));
                            },
                            child: Text(
                              'Torna alla home',
                              style: Theme.of(context).textTheme.titleMedium,
                            ))
                      ],
                    );
                  });
            }
          } else if (response.body.contains('"service_id":4')) {
            if (context.mounted) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ParentsPage()));
            }
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
