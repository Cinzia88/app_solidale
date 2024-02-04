
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';

import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/bloc/send_docs_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/form_docs.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/repository/send_docs_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/docs/form_docs.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/widget/edit_taxi_solidale.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CaricaDocsTaxiPage extends StatefulWidget {
  const CaricaDocsTaxiPage({super.key});

  @override
  State<CaricaDocsTaxiPage> createState() => _CaricaDocsTaxiPageState();
}

class _CaricaDocsTaxiPageState extends State<CaricaDocsTaxiPage> {
  




  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    //final mediaQueryData = MediaQuery.of(context);
    //final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    //final blockSizeVertical = screenHeight / 100;
    return BlocProvider<SendDocsBloc>(
      create: (context) => SendDocsBloc(
        context: context,
        sendDocsRepository: context.read<SendDocsRepository>(),
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
          body: BlocConsumer<SendDocsBloc, SendDocsState>(
              listener: (context, state) {
            if (state is SendDocsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } if(state is SendDocsLoaded) {
              Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      TaxiSolidaleEditPage()));
 }
            
          }, builder: (context, state) {
            return FormDocsTaxi();
          })),
    );
  }
}
