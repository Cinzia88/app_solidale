import 'dart:convert';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/secure_storage/secure_storage.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:app_solidale/service/service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class SignupRepository {
  final SecureStorage secureStorage = SecureStorage();
  Service service = Service();
  ValueSharedPrefsViewSlide valueSharedPrefsViewSlide =
      ValueSharedPrefsViewSlide();

  Future registerUserWithVerificationEmail(
    BuildContext context,
    String nome,
    String indirizzo,
    String telefono,
    String email,
    String password,
    String confirmPassword,
  ) {
    return registerUser(
      context,
      nome,
      indirizzo,
      telefono,
      email,
      password,
      confirmPassword,
    ).then((value) {
      service.verifyUser(email, context);
    });
  }

  Future registerUser(
    BuildContext context,
    String nome,
    String indirizzo,
    String telefono,
    String email,
    String password,
    String confirmPassword,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/register';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
          },
          body: jsonEncode({
            'name': nome,
            'indirizzo': indirizzo,
            'telefono': telefono,
            'email': email,
            'password': password,
            'confirm_password': confirmPassword,
          }));

      print('status ${response.statusCode}');

      switch (response.statusCode) {
        case 200:
          String token = jsonDecode(response.body)["token"];
          String message = jsonDecode(response.body)["message"];
          bool profiloCompleto = false;
          await valueSharedPrefsViewSlide.setProfileComplete(profiloCompleto);
          await secureStorage.writeSecureData('token', token);
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
        case 422:
          String message = 'L\'email è già registrata';

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
   /*Future getTokenCSRF() async{
    try {
var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/sanctum/csrf-cookie';
  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(Uri.parse(url),
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json',
  },
  );
 // await secureStorage.writeSecureData('csrfToken', apiResponse.data!);
        // ignore: use_build_context_synchronously
      String str = "${response.headers['set-cookie']}";
  const start = "=";
  const end = ";";

  final startIndex = str.indexOf(start);
  final endIndex = str.indexOf(end, startIndex + start.length);
final String csrfToken = str.substring(startIndex + start.length, endIndex);
await secureStorage.writeSecureData('csrf-token', csrfToken);
 return response;
   
    } catch (e) {
      print('sendimage error $e');
    }
  }
}
 */