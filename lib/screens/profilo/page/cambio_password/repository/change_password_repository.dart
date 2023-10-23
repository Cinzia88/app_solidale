





import 'dart:convert';
import 'package:anf_app/screens/signin/page/signin_page.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:anf_app/globals_token/globals_token.dart' as globals;



class ChangePasswordRepository {


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
            'new_password': newPassword,
            'confirmation_password': confirmPassword
          }));

    
     
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) =>  SignInPage()));
        print('responseCode ${globals.tokenValue}');
     
    } catch (e) {
      print('sendimage error $e');
    }
  }
}



  