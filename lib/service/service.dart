import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/presentation/page/presentation_page.dart';
import 'package:app_solidale/screens/profilo/page/profile_page.dart';
import 'package:app_solidale/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class Service {
  SecureStorage secureStorage = SecureStorage();

  Future verifyUser(String email, BuildContext context) {
    return readToken().then((value) => sendVerifyMailUser(email, context));
  }

  Future addImage(Map<String, String> body, List<XFile?> filepath) async {
    try {
      var url =
          '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/upload-documents';
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${globals.tokenValue}'
      };

      List<http.MultipartFile> newList = [];
      http.MultipartRequest? request;

      for (int i = 0; i < filepath.length; i++) {
        var multipartFile =
            await http.MultipartFile.fromPath('image[]', filepath[i]!.path);

        newList.add(multipartFile);

        request = http.MultipartRequest('POST', Uri.parse(url))
          ..fields.addAll(body)
          ..headers.addAll(headers)
          ..files.addAll(newList);
      }
      http.Response response =
          await http.Response.fromStream(await request!.send());
      print('sendimage success ${request.files.length}');
      print('sendimage successbody ${(json.decode(response.body))}');
      return response;
    } catch (e) {
      print('sendimage error $e');
    }
  }

  Future sendVerifyMailUser(
    String email,
    BuildContext context,
  ) async {
    try {
      print('email inviata all\'utente $email');
      var url =
          '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/send-verify-mail/$email';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${globals.tokenValue}'
        },
      );
      print('error verify ${response.statusCode}');

      switch (response.statusCode) {
        case 200:
          
          break;
        case 401:
          String message = 'Utente non autenticato';
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PresentationPage()));

         
          break;
        case 400:
          String message = 'Utente non trovato';

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

  Future deleteAccount(
    BuildContext context,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/delete-account';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${globals.tokenValue}'
        },
      );
      print('error verify ${response.statusCode}');

      switch (response.statusCode) {
        case 200:
          Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => PresentationPage()));
          await SecureStorage().deleteAll();
          globals.tokenValue = '';
          print('token logout ${globals.tokenValue}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: ColorConstants.orangeGradients3,
              content: Text(
                'Account eliminato',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )));
          break;
        case 401:
         Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => PresentationPage()));

          break;
        case 400:
          String message = 'Utente non trovato';
Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => PresentationPage()));
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
          String message =
              'Errore Server: impossibile stabilire una connessione';
Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => PresentationPage()));
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
        Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(builder: (context) => PresentationPage()));
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
