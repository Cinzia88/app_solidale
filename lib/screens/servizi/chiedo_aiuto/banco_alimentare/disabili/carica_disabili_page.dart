import 'dart:convert';

import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/repo/edit_docs_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/disabili/form_data_disabili.dart';

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/model/model_disabili.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/repo/edit_disabili_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_send/repo/send_disabili_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_send/send_disabili_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;

class DisabiliPage extends StatefulWidget {
  const DisabiliPage({super.key});

  @override
  State<DisabiliPage> createState() => _DisabiliPageState();
}

class _DisabiliPageState extends State<DisabiliPage> {
 DisabiliData? dataDisabili;


  @override
  void initState() {
    getDisabili();
    EditDocsRepository().getDocsData(context);
    super.initState();
  }


  Future getDisabili() async {
    var data = await EditDataDisabiliRepository().getDisabiliData(context);
    if(data!.disabile.isEmpty || data.numeroDisabili.isEmpty) {
setState(() {
  dataDisabili = null;
});
    } else {
      setState(() {
  dataDisabili = data;
});
    }
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
            return FormDataDisabili();
  })));
  }
}



