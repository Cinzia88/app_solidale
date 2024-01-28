import 'dart:convert';
import 'dart:io';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/model/edit_docs_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class EditDocsRepository {
  Future editDocs(BuildContext context, String id, Map<String, String> body,
      List<File> imagepath, List<File> pdfpath) async {
    try {
      var url =
          '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/document/edit/$id';
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${globals.tokenValue}'
      };

     

      List<http.MultipartFile> newList = [];
      http.MultipartRequest? request;

      if (imagepath.isNotEmpty) {
        for (int i = 0; i < imagepath.length; i++) {
          File file = File(imagepath[i].path);
          var multipartFile = http.MultipartFile(
              'files[]', file.readAsBytes().asStream(), file.lengthSync(),
              filename: file.path.split('/').last);
          newList.add(multipartFile);

          request = http.MultipartRequest('POST', Uri.parse(url))
            ..fields.addAll(body)
            ..headers.addAll(headers)
            ..files.addAll(newList);
        }
      } else {
        for (int i = 0; i < pdfpath.length; i++) {
          File file = File(pdfpath[i].path);
          var multipartFile = http.MultipartFile(
              'files[]', file.readAsBytes().asStream(), file.lengthSync(),
              filename: file.path.split('/').last);
          newList.add(multipartFile);

          request = http.MultipartRequest('POST', Uri.parse(url))
            ..fields.addAll(body)
            ..headers.addAll(headers)
            ..files.addAll(newList);
        }
      }
      http.StreamedResponse response = await request!.send();
      print('statuscodedata ${response.statusCode}');
      print('sendimage success ${request.fields}');

      switch (response.statusCode) {
        case 200:
        Navigator.pop(context);
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
          print('errore generico');
      }

      return response;
    } catch (e) {
      print('sendimage error $e');
    }
  }

  Future<List<DocsData>> getDocsData(BuildContext context) async {
    var url =
        '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/list-documents/${globals.userData!.id}';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${globals.tokenValue}'
      },
    );
    final List<dynamic> body = json.decode(response.body);
    var data = body.map((e) => DocsData.fromJson(e)).toList();
    globals.listDocsData = data;

    print('docs ${globals.listDocsData}');

    switch (response.statusCode) {
      case 200:
        print('success data request');
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
        String message = 'Errore Server: impossibile stabilire una connessione';
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
        print('errore generico');
    }
    return data;
  }
}
