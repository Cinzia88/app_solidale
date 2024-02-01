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