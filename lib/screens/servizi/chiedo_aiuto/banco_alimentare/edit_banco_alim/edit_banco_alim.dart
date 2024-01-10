import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/bloc/read_request_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/page/edit_docs_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/disabili/bloc_edit_disabili/page/edit_disabili.dart';

import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/page/edit_parents_page.dart';

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
                              height: 40,
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ParentsPageEdit()));
                                  },
                                  child: CustomCardsCommon(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  ' Modifica Dati Componenti Familiari',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        2.5 * blockSizeVertical,
                                                    color: ColorConstants
                                                        .orangeGradients3,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'Modifica i dati dei tuoi componenti familiari',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DisabiliBancoPageEdit()));
                                  },
                                  child: CustomCardsCommon(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  ' Modifica Dati Disabilità Familiare',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        2.5 * blockSizeVertical,
                                                    color: ColorConstants
                                                        .orangeGradients3,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'Modifica i dati della presenza di disabilità nel nucleo familiare',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CaricaDocsEditPage()));
                                  },
                                  child: CustomCardsCommon(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  ' Modifica Documenti Caricati',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        2.5 * blockSizeVertical,
                                                    color: ColorConstants
                                                        .orangeGradients3,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'Modifica i documenti che hai caricato',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CommonStyleButton(
                                        title: 'Invia',
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
                              ],
                            ),
                          ])),
                );
        }),
      ),
    );
  }
}
