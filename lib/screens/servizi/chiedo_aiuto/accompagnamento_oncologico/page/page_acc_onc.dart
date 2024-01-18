import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/form_acc_onc.dart';
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
        body: 
             FormAccompagnamentoOncologico());
          }
        
  
  
}



