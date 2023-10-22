


import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:anf_app/globals_token/globals_token.dart' as globals;


class ServiceLogout {
  Future logoutUser(BuildContext context) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/logout';
     var response = await http.post(Uri.parse(url),
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json',
  });

    
print('logout');
  
  return response;
    } catch (e) {
      print('sendimage error $e');
    }
  }


 
}
  
