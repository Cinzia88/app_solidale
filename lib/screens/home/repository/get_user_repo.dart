import 'dart:convert';
import 'dart:io';
import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:app_solidale/secure_storage/secure_storage.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../model/get_user_model.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class ReadDataUserRepository {
  SecureStorage secureStorage = SecureStorage();
  ValueSharedPrefsViewSlide valueSharedPrefsViewSlide =
      ValueSharedPrefsViewSlide();
  Future readUser(BuildContext context) {
    return readToken().then((value) => getUserData(context));
  }

  Future<UserData> getUserData(BuildContext context) async {
    var client = http.Client();
    var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/user';
    print('tokenValue ${globals.tokenValue}');

    http.Response response =
        await client.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${globals.tokenValue}",
    });

    UserData dataUser = UserData.fromJson(jsonDecode(response.body));

    print('dataUser ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        print('user auth ${dataUser.id}');
        break;
      case 401:
        secureStorage.deleteSecureData('token');
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SignInPage()));

        // ignore: use_build_context_synchronously

        break;
        case 429:
        String message = 'Errore Server: troppe richieste';

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
        String message = 'Errore Server: impossibile stabilire una connessione';

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

    return dataUser;
  }

  Future editUser(
    BuildContext context,
    String id,
    String nome,
    String indirizzo,
    String telefono,
    String email,
    String deviceToken,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/edit-user/$id';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.put(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body: jsonEncode({
            'name': nome,
            'indirizzo': indirizzo,
            'telefono': telefono,
            'email': email,
            'device_token': deviceToken,
          }));

      print('status ${response.statusCode}');

      switch (response.statusCode) {
        case 200:
          print('utente modificato');
          // ignore: use_build_context_synchronously
           
          
          break;
        case 422:
          
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

  Future saveToken(
    BuildContext context,
    
    String deviceToken,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/save-token/${globals.userData!.id}';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.put(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body: jsonEncode({
           
            'device_token': deviceToken,
          }));

      print('statusreaduser ${response.statusCode}');

      switch (response.statusCode) {
        case 200:
          print('utente modificato');
          // ignore: use_build_context_synchronously
           
          
          break;
           case 404:
          print('statuserr ${response.body}');
          // ignore: use_build_context_synchronously
           
          
          break;
        case 422:
          
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
