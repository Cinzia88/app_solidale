import 'dart:convert';
import 'dart:io';
import 'package:app_solidale/screens/news/model/list_news_model.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:flutter/material.dart';

class NewsRepository {
  List<ListNewsModel>? newsList;
  Future<List<ListNewsModel>> getListNews(BuildContext context, int page) async {
    var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/news?page=$page';
    var client = http.Client();

    http.Response response =
        await client.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${globals.tokenValue}",
    });
print('page $page');
    List<dynamic> list = jsonDecode(response.body)['data'];
    print('listnews ${response.body}');
    newsList =
        List<ListNewsModel>.from(list.map((x) => ListNewsModel.fromJson(x)));

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
    return newsList ?? [];
  }
}
