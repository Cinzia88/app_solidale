


import 'package:app_solidale/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;


class ServiceLogout {
final SecureStorage secureStorage = SecureStorage();
  Future logoutUser(BuildContext context) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/logout';
     var response = await http.post(Uri.parse(url),
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json',
    'Authorization': 'Bearer ${globals.tokenValue}'
  });
  print('resp logout ${response.statusCode}');
switch (response.statusCode) {
        case 200:

   secureStorage.deleteSecureData('token');
          break;
        case 401:
          String message = 'Utente non autenticato';
                 secureStorage.deleteSecureData('token');

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
  
