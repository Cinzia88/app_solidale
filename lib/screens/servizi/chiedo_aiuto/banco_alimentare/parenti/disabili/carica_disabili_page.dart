import 'dart:io';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/bloc/send_parents_data_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/disabili/form_data_disabili.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/form_data_parents/form_data_parents.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/repository/send_parents_data_repository.dart';
import 'package:flutter/services.dart';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/menu/area_personale/profilo_page.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/service/service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class DisabiliPage extends StatefulWidget {
  const DisabiliPage({super.key});

  @override
  State<DisabiliPage> createState() => _DisabiliPageState();
}

class _DisabiliPageState extends State<DisabiliPage> {
 


  @override
  Widget build(BuildContext context) {
   

    return BlocProvider<SendParentsDataBloc>(
      create: (context) => SendParentsDataBloc(
        context: context,
        sendDataParentsRepository: context.read<SendDataParentsRepository>(),
      ),
      child: Scaffold(
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
          body: BlocConsumer<SendParentsDataBloc, SendParentsDataState>(
              listener: (context, state) {
            if (state is SendParentsDataErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          }, builder: (context, state) {
            return FormDataDisabili();
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