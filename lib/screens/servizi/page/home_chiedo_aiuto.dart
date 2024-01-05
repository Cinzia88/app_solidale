// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/page/custom_card.dart';
import 'package:app_solidale/screens/servizi/page/custom_edit_card.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../const/color_constants.dart';
import 'package:http/http.dart' as http;

class HomeChiedoAiuto extends StatefulWidget {
  @override
  State<HomeChiedoAiuto> createState() => _HomeChiedoAiutoState();
}

class _HomeChiedoAiutoState extends State<HomeChiedoAiuto> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getRequestUser();
  }

  Future<List<RequestData>> getRequestUser() async {
    var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/richiesta/show/${globals.userData!.id}';
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
    var data = body.map((e) => RequestData.fromJson(e)).toList();
    setState(() {
      globals.listRequestData = data;
    });
print('reqdata ${globals.listRequestData}');
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
    return data ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 75.0,
          automaticallyImplyLeading: true,
          flexibleSpace: customAppBar(context: context),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: NavigationDrawerWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      'Chiedo Aiuto',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Divider(
                      color: ColorConstants.orangeGradients3,
                    ),
                   globals.listRequestData.isEmpty ? customCardsServiceChiedoAiuto(context) : customEditCardsServiceChiedoAiuto(context),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
