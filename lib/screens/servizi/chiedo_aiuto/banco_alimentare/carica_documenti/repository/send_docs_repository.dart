import 'dart:io';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/const/response.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/repo/edit_docs_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/edit_banco_alim/edit_banco_alim.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/widget/edit_taxi_solidale.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class SendDocsRepository {


 Future sendDocs(BuildContext context, Map<String, String> body, List<File> imagepath,
      List<File> pdfpath) async {
        ResponseStatusCode responseStatusCode;
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
   

        switch (response.statusCode) {
          case 200:
await ValueSharedPrefsViewSlide().setResponse(response.statusCode);
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





  
   
}
