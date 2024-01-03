import 'dart:convert';
import 'dart:io';
import 'package:app_solidale/screens/servizi/bloc_show_request_service/model_get_service/get_service_req.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class ShowDataTypeServiceRepository {

   Future<ServiceReqData> showDataTypeservice(BuildContext context) async {
    var client = http.Client();
    var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api//richiesta/show/${globals.userData!.id}';
    print('tokenValue ${globals.tokenValue}');

    http.Response response =
        await client.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${globals.tokenValue}",
    });

    ServiceReqData dataUser = ServiceReqData.fromJson(jsonDecode(response.body));

    print('dataUser ${response.headers}');
    switch (response.statusCode) {
      case 200:
        print('user edit ${dataUser.id}');
        break;
      case 401:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SignInPage()));

        // ignore: use_build_context_synchronously

        break;
      case 500:
        String message = 'Errore Server: impossibile stabilire una connessione';

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

    return dataUser;
  }
  
}
