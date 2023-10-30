import 'dart:convert';
import 'package:anf_app/secure_storage/secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:anf_app/globals_variables/globals_variables.dart' as globals;

class ForgetPasswordRepository {
  final SecureStorage secureStorage = SecureStorage();

  Future forgetPassword(
    BuildContext context,
    String email,
  ) {
    return readToken().then((value) => forgetPasswordUser(context, email));
  }

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
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body: jsonEncode({
            'email': email,
          }));

      return response;
    } catch (e) {
      print('sendimage error $e');
    }
  }

  Future<String> readToken() async {
    String token = await secureStorage.readSecureData('token');
    final startIndex = token.indexOf("|");
    globals.tokenValue = token.substring(startIndex).replaceAll("|", "");

    return globals.tokenValue!;
  }
}
