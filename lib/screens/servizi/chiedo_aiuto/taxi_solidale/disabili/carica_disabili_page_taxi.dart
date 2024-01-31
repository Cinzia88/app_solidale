import 'dart:convert';

import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/model/model_disabili.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_send/repo/send_disabili_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_send/send_disabili_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/disabili/form_data_disabili_taxi.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;

class DisabiliTaxiPage extends StatefulWidget {
  const DisabiliTaxiPage({super.key});

  @override
  State<DisabiliTaxiPage> createState() => _DisabiliTaxiPageState();
}

class _DisabiliTaxiPageState extends State<DisabiliTaxiPage> {





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDisabiliData();
  }

  Future<DisabiliData> getDisabiliData() async {
     var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/disabile/show/${globals.userData!.id}';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${globals.tokenValue}'
      },
    );
     var body = json.decode(response.body)[0];
    var data = DisabiliData.fromJson(body);
      globals.dataDisabili = data;
print('disabili ${response.body}');
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
   

    return BlocProvider<SendDisabiliDataBloc>(
      create: (context) => SendDisabiliDataBloc(
        context: context,
        sendDisabiliDataRepository: context.read<SendDisabiliDataRepository>(),
      ),
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),
          
          ),
          drawer: NavigationDrawerWidget(),
          body: BlocConsumer<SendDisabiliDataBloc, SendDisabiliDataState>(
              listener: (context, state) {
            if (state is SendDisabiliDataErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          }, builder: (context, state) {
            return FormDataDisabiliTaxi();
  })));
  }
}



/*     List<ParentsData> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var nome = nomeComponente[i].text;
      var anni = anniComponente[i].text;
      var grado = gradoComponente[i].text;
      service.sendDataParents(context, nome, anni, grado);
    } */