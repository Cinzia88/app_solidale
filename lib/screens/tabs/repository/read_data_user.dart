import 'dart:convert';
import 'dart:io';

import 'package:anf_app/secure_storage/secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../model/get_user_model.dart';
import 'package:anf_app/globals_variables/globals_variables.dart' as globals;

class ReadDataUserRepository {
  SecureStorage secureStorage = SecureStorage();

  Future readUser() {
    return readToken().then((value) => getUserData());
  }

  Future<UserData> getUserData() async {
    var client = http.Client();
    var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/user';
    print('tokenValue ${globals.tokenValue}');

    http.Response response =
        await client.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${globals.tokenValue}",
    });



    if(response.statusCode == 401) {
       secureStorage.deleteSecureData('token');
    }

    UserData dataUser = UserData.fromJson(jsonDecode(response.body));
    print('dataUser ${response.statusCode}');

    return dataUser;
  }

  Future<String> readToken() async {
    String token = await secureStorage.readSecureData('token');
    final startIndex = token.indexOf("|");

    if (token == 'Nessun dato trovato!') {
      globals.tokenValue = null;
    } else {
      globals.tokenValue = token.substring(startIndex).replaceAll("|", "");
    }
    return globals.tokenValue ?? '';
  }
}
