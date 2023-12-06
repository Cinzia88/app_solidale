import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/bloc/send_parents_data_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/disabili/form_data_disabili.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/repository/send_parents_data_repository.dart';

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';

import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/bloc/send_disabili_data_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/repository/send_data_disabili_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/widget/form_taxi_solidale.dart';
import 'package:app_solidale/screens/servizi/page_service/form_phone.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccompagnamentoOncologicoPage extends StatefulWidget {
  const AccompagnamentoOncologicoPage({super.key});

  @override
  State<AccompagnamentoOncologicoPage> createState() => _AccompagnamentoOncologicoPageState();
}

class _AccompagnamentoOncologicoPageState extends State<AccompagnamentoOncologicoPage> {
 


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
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: NavigationDrawerWidget(),
        body: FormAccompagnamentoOncologico());
  
  }
}



