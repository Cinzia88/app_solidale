import 'dart:convert';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/form_data_parents/carica_parenti_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/page/disabili/carica_disabili_page_taxi.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/page/disabili/edit_disabili/edit_disabili_page.dart';
import 'package:app_solidale/screens/servizi/page/home_chiedo_aiuto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class EditDataTypeServiceRepository {













  Future<List<RequestData>> getRequestData(BuildContext context) async {
     var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/richiesta/show/${globals.userData!.id}';
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
    var data = body.map((e) => RequestData.fromJson(e)).toList();
      globals.listRequestData = data;
print('reqdata ${response.body}');
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

  Future editRequest(
     BuildContext context,
   String idRequest,
   String serviceId,
   String nome,
   String telefono,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/richiesta/update/$idRequest';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.put(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body: jsonEncode({
           'service_id': serviceId,
            'nome': nome,
            'telefono': telefono,
          }));

print('reqdata ${response.body}');

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
          } else if (response.body.contains('"service_id":"2"')) {
            if (context.mounted) {

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DisabiliTaxiPageEdit()));
            }
            break;
          } else if (response.body.contains('"service_id":"3"')) {
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
                            child:
                                Image.asset(PathConstants.accompagnamOncolog),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Stiamo elaborando i tuoi dati',
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
       
          // ignore: use_build_context_synchronously
           
          
        
        case 422:
          
          break;
        case 500:
          String message =
              'Errore Server: impossibile stabilire una connessione';
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
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Errore generico',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )));
      }

      return response;
    } catch (e) {
      print('sendimage error $e');
    }
  }
}