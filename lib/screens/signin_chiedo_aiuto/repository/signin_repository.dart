



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../secure_storage/secure_storage.dart';
import '../../tabs_chiedo_aiuto/page/page_tabs.dart';


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

      if (response.statusCode == 200) {
               print('signin ${jsonDecode(response.body)}');

         String token = jsonDecode(response.body)["token"];
  await secureStorage.writeSecureData('token', token);
        // ignore: use_build_context_synchronously
       print('responsetoken $token');
        Navigator.push(
            context, MaterialPageRoute(builder: (_) =>  TabsPage()));
        print('response ${response.body}');
      } else {
        print('erroresponse ${response.body}');
      }
    } catch (e) {
      print('sendimage error $e');
    }
  }
}



  