import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/bloc/read_request_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_show_request_service/bloc/show_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_show_request_service/repository/show_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/page/edit_parents_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/widget/edit_taxi_solidale.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/page/form_taxi_solidale.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class IntroBancoAlimentareEdit extends StatefulWidget {
  const IntroBancoAlimentareEdit({super.key});

  @override
  State<IntroBancoAlimentareEdit> createState() =>
      _IntroBancoAlimentareEditState();
}

class _IntroBancoAlimentareEditState extends State<IntroBancoAlimentareEdit> {
  String idBancoEdit = '';

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;

    return BlocProvider<ReadRequestBloc>(
      create: (context) => ReadRequestBloc(
        context: context,
        editDataTypeServiceRepository:
            context.read<EditDataTypeServiceRepository>(),
      )..add(FetchRequestEvent()),
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
        body: BlocConsumer<ReadRequestBloc, ReadRequestState>(
            listener: (context, state) {
          if (state is ReadRequestErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          } else if (state is ReadRequestLoadedState) {
            for (int i = 0; i < state.data.length; i++) {
              setState(() {
                idBancoEdit = state.data[i].idRequest;
              });
            }
          }
        }, builder: (context, state) {
          return state is ReadRequestLoadingState ||
                  state is EditRequestLoadingState
              ? loadingWidget(context)
              : SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(
                        20.0,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(idBancoEdit),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      child: Image.asset(
                                        PathConstants.bancoAlim,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3 * blockSizeVertical,
                                    ),
                                    Text(
                                      'Banco Alimentare',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                    'Modifica i dati dei tuoi componenti familiari'),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                       children: [
                                         CommonStyleButton(
                                    title: 'Modifica Componenti',
                                    onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => ParentsPageEdit()));
                                    },
                                    iconWidget: Text('')),
                                       ],
                                     ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                Text(
                                    'Modifica la presenza di disabilità nel nucleo familiare'),
                                     CommonStyleButton(
                                    title: 'Modifica Disabilità in Famiglia',
                                    onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => ParentsPageEdit()));
                                    },
                                    iconWidget: Text('')),
                              ],
                            ),
                             SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                Text(
                                    'Modifica documenti caricati'),
                                     CommonStyleButton(
                                    title: 'Modifica File',
                                    onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => ParentsPageEdit()));
                                    },
                                    iconWidget: Text('')),
                              ],
                            ),
                           
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CommonStyleButton(
                                    title: 'Inizia',
                                    onTap: () {
                                      EditDataTypeServiceRepository()
                                          .editRequest(
                                              context,
                                              idBancoEdit,
                                              '4',
                                              globals.userData!.nome,
                                              globals.userData!.telefono);
                                    },
                                    iconWidget: Text('')),
                              ],
                            )
                          ])),
                );
        }),
      ),
    );
  }
}
