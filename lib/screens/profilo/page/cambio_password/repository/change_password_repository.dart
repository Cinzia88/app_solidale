import 'dart:convert';
import 'package:app_solidale/screens/presentation/page/presentation_page.dart';
import 'package:app_solidale/screens/service/logout.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;

class ChangePasswordRepository {
  ValueSharedPrefsViewSlide valueSharedPrefsViewSlide = ValueSharedPrefsViewSlide();

  ServiceLogout serviceLogout = ServiceLogout();
  Future changePasswordUser(
    BuildContext context,
    String currentPassword,
    String newPassword,
    String confirmPassword,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/change-password';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body: jsonEncode({
            'old_password': currentPassword,
            'password': newPassword,
            'confirm_password': confirmPassword
          }));
      switch (response.statusCode) {
        case 200:
          // ignore: use_build_context_synchronously
          Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => SignInPage()));
          // ignore: use_build_context_synchronously
          serviceLogout.logoutUser(context);
          break;
        case 400:
          String message = jsonDecode(response.body)['message'];

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
        case 401:
          String message = 'Utente non autenticato';
Navigator.push(context, MaterialPageRoute(builder: (_) => PresentationPage()));

          
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
