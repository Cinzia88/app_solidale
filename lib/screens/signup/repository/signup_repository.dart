
import 'dart:convert';
import 'package:anf_app/api_response/model/api_response_model.dart';
import 'package:anf_app/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../signin/page/signin_page.dart';

class SignupRepository {

  Future registerUser(BuildContext context, String nome, String email, String password, String confirmPassword, String richiesta) async{
    try {
             

var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/register';
  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(Uri.parse(url),
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json',
  },
  body: jsonEncode({
    'nome': nome,
    'email': email,
    'password': password,
    'password_confirmation': confirmPassword,
    'richiesta': richiesta
  }));
 if (response.statusCode == 200) {
               print('signup ${jsonDecode(response.body)}');

Navigator.pushReplacement(            context, MaterialPageRoute(builder: (_) =>  SignInPage()));

      } else {
        print('response ${response.statusCode}');
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