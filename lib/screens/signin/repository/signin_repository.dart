import 'dart:convert';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/model_get_service/get_service_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;

import '../../../secure_storage/secure_storage.dart';

class SignInRepository {
  final SecureStorage secureStorage = SecureStorage();

  Future loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/login';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
          body: jsonEncode({
            'email': email,
            'password': password,
          }));
          print('error login ${response.statusCode}');
      switch (response.statusCode) {
        case 200:
          String token = jsonDecode(response.body)["token"];
          await secureStorage.writeSecureData('token', token);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PresentationPage()),
          );

          break;
            case 400:
          String message = 'Email non verificata';

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
        case 422:
          String message = 'Credenziali non corrette';

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
              backgroundColor: Colors.transparent,
              content: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )));
      }
    } catch (e) {
      print('sendimage error $e');
    }
  }

  Future<List<GetServiceModel>> getService(
    BuildContext context,
  ) async {
    List<GetServiceModel>? dataService;
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/servizi';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${globals.tokenValue}'
        },
      );
   var decodedResponse = jsonDecode(response.body);
     DataServiceModel  dataprint = DataServiceModel.fromJson(decodedResponse);
     dataService = dataprint.dataService;
     
               print('offro ${dataService[0].id}');

      switch (response.statusCode) {
        case 200:


          print('listServiceGetData ${dataService}');

          break;
        case 422:
          String message = 'Credenziali non corrette';

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
              backgroundColor: Colors.transparent,
              content: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )));
      }
    } catch (e) {
      print('error listservice $e');
    }
    return dataService ?? [];
  }
}
