import 'dart:convert';
import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/presentation/page/presentation_page.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ForgetPasswordRepository {

ValueSharedPrefsViewSlide valueSharedPrefsViewSlide = ValueSharedPrefsViewSlide();

  Future forgetPasswordUser(
    BuildContext context,
    String email,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/forget-password';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
          body: jsonEncode({
            'email': email,
          }));
switch (response.statusCode) {
        case 200:
          String message = 'Ti è stato inviato via mail il link di reset password';
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorConstants.orangeGradients3,
              content: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )));
          break;
        case 401:
Navigator.push(context, MaterialPageRoute(builder: (_) => PresentationPage()));

          
          break;
        case 400:
          String message = 'Utente non trovato';

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
