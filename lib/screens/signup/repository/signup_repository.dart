
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SignupRepository {
  Future registerUser(String email, String password, String confirmPassword) async{
    try {
var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/register';
  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(Uri.parse(url),
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json',
  },
  body: jsonEncode({
    'email': email,
    'password': password,
    'password_confirmation': confirmPassword,
  }));

 return response;
   
    } catch (e) {
      print('sendimage error $e');
    }
  }
}
