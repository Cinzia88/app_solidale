import 'dart:convert';
import 'dart:io';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/menu/messages/model/list_messages_model.dart';
import 'package:app_solidale/screens/news/model/list_news_model.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:flutter/material.dart';

class MessageRepository {
  List<ListMessageModel>? messagesList;
  Future<List<ListMessageModel>> getListMessages(
      BuildContext context, int page) async {
    var url =
        '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/food/message/${globals.userData!.id}?page=$page';
    var client = http.Client();

    http.Response response =
        await client.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${globals.tokenValue}",
    });
    List<dynamic> list = jsonDecode(response.body)['data'];
    messagesList = List<ListMessageModel>.from(
        list.map((x) => ListMessageModel.fromJson(x)));
    print('page $page');
    print('messagesList ${jsonDecode(response.body)['data']}');
    print('messagesError ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        break;
      case 401:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SignInPage()));

        // ignore: use_build_context_synchronously

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
    return messagesList ?? [];
  }

  Future editMessage(
    BuildContext context,
    String idMessage,
    String serviceId,
    String inviato,
    String dataConsegna,
    String risposta,
    String consegnato,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/message/update/$idMessage';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.put(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body: jsonEncode({
             'service_id': serviceId,
            'inviato': inviato,
            'data_consegna': dataConsegna,
            'risposta': risposta,
            'consegnato': consegnato,
          }));

      print('status ${response.statusCode}');

      switch (response.statusCode) {
        case 200:
              print('message ${response.statusCode}');

             
            

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
}
