



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../home/tabs/page_tabs.dart';


class SignInRepository {
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

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const TabsPage()));
        print('response ${response.body}');
      } else {
        print('erroresponse ${response.body}');
      }
    } catch (e) {
      print('sendimage error $e');
    }
  }
}



  