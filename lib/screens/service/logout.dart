


import 'package:anf_app/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:anf_app/globals_variables/globals_variables.dart' as globals;


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

   secureStorage.deleteSecureData('token');
print('logout');
  
  return response;
    } catch (e) {
      print('sendimage error $e');
    }
  }


 
}
  
