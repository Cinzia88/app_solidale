import 'dart:convert';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/bloc/read_request_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/carica_docs_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/model/edit_docs_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/page/edit_docs_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/repo/edit_docs_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/disabili/carica_disabili_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/disabili/page_edit/edit_disabili_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/model/edit_parents_model.dart';

import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/page/edit_parents_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/repo/edit_parents_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/form_data_parents/carica_parenti_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/bloc/edit_disabili_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/model/model_disabili.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/repo/edit_disabili_repo.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class IntroBancoAlimentareEdit extends StatefulWidget {
  const IntroBancoAlimentareEdit({super.key});

  @override
  State<IntroBancoAlimentareEdit> createState() =>
      _IntroBancoAlimentareEditState();
}

class _IntroBancoAlimentareEditState extends State<IntroBancoAlimentareEdit> {
  String idBancoEdit = '';
  DisabiliData? dataDisabili;
  List<DocsData>? dataFiles;
  bool loadingFiles = true;

  @override
  void initState() {
    getDisabili();
    getFiles();
    getComponents();
    super.initState();
  }

  Future getDisabili() async {
    var data = await EditDataDisabiliRepository().getDisabiliData(context);
    if (data.disabile.isEmpty || data.numeroDisabili.isEmpty) {
      setState(() {
        dataDisabili = null;
      });
    } else {
      setState(() {
        dataDisabili = data;
      });
    }
  }
  Future getComponents() async {
     await EditDataParentsRepository().getParentsData(context);
    
  }
  Future getFiles() async {
    var data = await EditDocsRepository().getDocsData(context);
    if (data.isEmpty) {
      setState(() {
        dataFiles = [];
        loadingFiles = false;
      });
    } else {
      setState(() {
        dataFiles = data;
        loadingFiles = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    EditDataParentsRepository().getParentsData(context);
    EditDataDisabiliRepository().getDisabiliData(context);
    EditDocsRepository().getDocsData(context);
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
                          print(state.errorMessage,);

          } else if (state is ReadRequestLoadedState) {
            for (int i = 0; i < state.data.length; i++) {
              setState(() {
                idBancoEdit = state.data[i].idRequest;
              });
            }
          }
        }, builder: (context, state) {
          return state is ReadRequestLoadingState ||
                  state is EditRequestLoadingState ||
                  loadingFiles == true
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
                            globals.listParentsData.isEmpty ||
                                    dataDisabili == null ||
                                    dataFiles!.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Richiesta Incompleta:',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        globals.listParentsData.isEmpty
                                            ? Text(
                                                '- Dati Componenti Familiari Mancanti',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              )
                                            : SizedBox(),
                                        dataDisabili == null
                                            ? Text(
                                                '- Dati Disabilità Familiare Mancanti',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              )
                                            : SizedBox(),
                                        dataFiles!.isEmpty
                                            ? Text(
                                                '- Documenti Mancanti',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 40,
                            ),
                            Column(
                              children: [
                                globals.listParentsData.isEmpty
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ParentsPage()));
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
                                                        'Aggiungi Dati Componenti Familiari',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 2.5 *
                                                              blockSizeVertical,
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
                                                      'Aggiungi i dati dei tuoi componenti familiari',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
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
                                                        'Modifica Dati Componenti Familiari',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 2.5 *
                                                              blockSizeVertical,
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
                                dataDisabili == null
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DisabiliPage()));
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
                                                        'Aggiungi Dati Disabilità Familiare',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 2.5 *
                                                              blockSizeVertical,
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
                                                      'Aggiungi i dati della presenza di disabilità nel nucleo familiare',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
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
                                                        'Modifica Dati Disabilità Familiare',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 2.5 *
                                                              blockSizeVertical,
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
                                dataFiles!.isEmpty
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CaricaDocsPage()));
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
                                                        'Aggiungi Documenti',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 2.5 *
                                                              blockSizeVertical,
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
                                                      'Carica i tuoi documenti',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
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
                                                        'Modifica Documenti Caricati',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 2.5 *
                                                              blockSizeVertical,
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
                                  height: 60,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CommonStyleButton(
                                        title: 'Invia Richiesta',
                                        onTap: globals
                                                    .listParentsData.isEmpty ||
                                                dataDisabili == null ||
                                                dataFiles!.isEmpty
                                            ? null
                                            : () async {
                                                EditDataTypeServiceRepository()
                                                    .editRequest(
                                                        context,
                                                        idBancoEdit,
                                                        '4',
                                                        '',
                                                        globals.userData!.nome,
                                                        globals
                                                            .userData!.telefono,
                                                        '',
                                                        '',
                                                        '',
                                                        '')
                                                    .then((value) async {
                                                  SendDataTypeServiceRepository()
                                                      .sendMailService(context,
                                                          'Banco Alimentare');
                                                });
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
