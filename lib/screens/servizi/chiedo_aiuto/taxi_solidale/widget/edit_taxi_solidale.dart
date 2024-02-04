import 'dart:convert';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/bloc_edit_docs/bloc/read_docs_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/model/edit_docs_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/repo/edit_docs_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/bloc/edit_disabili_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/repo/edit_disabili_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/destinazione/destination_taxi_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/destinazione/edit_destinazione/page_edit_destinazione.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/docs/carica_docs_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/docs/edit_docs/page/edit_docs_page.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/bloc/read_request_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/model/model_disabili.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/disabili/carica_disabili_page_taxi.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/disabili/edit_disabili/edit_disabili_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/widget/edit_data_destinatario.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TaxiSolidaleEditPage extends StatefulWidget {
  @override
  State<TaxiSolidaleEditPage> createState() => _TaxiSolidaleEditPageState();
}

class _TaxiSolidaleEditPageState extends State<TaxiSolidaleEditPage> {
  final TextEditingController _nameAnotherController = TextEditingController();
  final TextEditingController _telepAnotherController = TextEditingController();
  int _value = 1;
  String idTaxiSolidaleEdit = '';
  bool? datiDestinazione;
  bool datiFiles = false;
  bool loading = true;
    DisabiliData? dataDisabili;
  List<DocsData>? dataFiles;
    bool loadingFiles = true;
  bool loadingDisable = true;

  @override
  void initState() {
    getDisabili();
    getFiles();
    EditDataTypeServiceRepository().getRequestData(context);
    super.initState();
  }

   

  Future getDisabili() async {
    var data = await EditDataDisabiliRepository().getDisabiliData(context);
    if (data.disabile.isEmpty || data.numeroDisabili.isEmpty) {
      setState(() {
        dataDisabili = null;
        loadingFiles = false;
      });
    } else {
      setState(() {
        dataDisabili = data;
        loadingFiles = false;
      });
    }
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
               
                for (int i = 0; i < globals.listRequestData.length; i++) {
                  if (globals.listRequestData[i].serviceId == '2' &&
                      globals.listRequestData[i].partenza != 'null' &&
                      globals.listRequestData[i].destinazione != 'null' &&
                      globals.listRequestData[i].data != 'null') {
                    setState(() {
                      datiDestinazione = true;
                    });
                  } else if (globals.listRequestData[i].serviceId == '2' &&
                      globals.listRequestData[i].partenza == 'null' &&
                      globals.listRequestData[i].destinazione == 'null' &&
                      globals.listRequestData[i].data == 'null') {
                    setState(() {
                      datiDestinazione = false;
                    });
                  }
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
                                            PathConstants.taxiSolidale,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3 * blockSizeVertical,
                                        ),
                                        Text(
                                          'Taxi Solidale',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                dataDisabili == null ||
                                        datiDestinazione == false ||
                                        dataFiles!.isEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 40.0),
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
                                            datiDestinazione == false
                                                ? Text(
                                                    '- Dati Partenza/Destinazione Mancanti',
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
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TaxiSolidaleEditDataDestinatarioPage()));
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
                                                      'Modifica Dati Destinatario',
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
                                                    'Modifica i dati del richiedente',
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
                                    datiDestinazione == false
                                        ? GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DestinationTaxiEditPage()));
                                            },
                                            child: CustomCardsCommon(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Aggiungi Dati Partenza/Destinazione',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                          'Aggiungi i dati di indirizzo di partenza e/o destinazione',
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
                                                          DestinationTaxiEditPage()));
                                            },
                                            child: CustomCardsCommon(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Modifica Dati Partenza/Destinazione',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                          'Modifica i dati di indirizzo di partenza e/o destinazione',
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
                                                          DisabiliTaxiPage()));
                                            },
                                            child: CustomCardsCommon(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Aggiungi Dati Disabilità Familiare',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                          DisabiliTaxiPageEdit()));
                                            },
                                            child: CustomCardsCommon(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Modifica Dati Disabilità Familiare',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                          CaricaDocsTaxiPage()));
                                            },
                                            child: CustomCardsCommon(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Aggiungi Documenti',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                          CaricaDocsEditTaxiPage()));
                                            },
                                            child: CustomCardsCommon(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            'Modifica Documenti',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                          'Modifica i tuoi documenti',
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
                                            onTap: dataDisabili ==
                                                        null ||
                                                    datiDestinazione == false ||
                                                    dataFiles!.isEmpty
                                                ? null
                                                : () {
                                                    showDialog(
                                                        barrierDismissible:
                                                            false,
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 50,
                                                                  child: Image.asset(
                                                                      PathConstants
                                                                          .taxiSolidale),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Text(
                                                                  'Stiamo elaborando i tuoi dati',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ],
                                                            ),
                                                            content: const Text(
                                                                'Ti contatteremo al più presto!'),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            actions: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                PresentationPage()));
                                                                  },
                                                                  child: Text(
                                                                    'Torna alla home',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleMedium,
                                                                  ))
                                                            ],
                                                          );
                                                        });
                                                    SendDataTypeServiceRepository()
                                                        .sendMailService(
                                                            context,
                                                            'Taxi Solidale');

                                                    FocusScope.of(context)
                                                        .unfocus();
                                                  },
                                            iconWidget: Text('')),
                                      ],
                                    )
                                  ],
                                ),
                              ])),
                    );
            })));
  }

  _formSelectService() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Flexible(
                  child: Text(
                'Vorrei accedere al Servizio Taxi Solidale per:',
              )),
            ],
          ),
        ),
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                }),
            SizedBox(
              width: 10,
            ),
            Text('Me'),
          ],
        ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                }),
            SizedBox(
              width: 10,
            ),
            Text('Un Mio Familiare'),
          ],
        ),
        /* Row(
              children: [
                
                Checkbox(
                    value: true,
                    tristate: true,
                    onChanged: (value) {
                      setState(() {
                        personale = value!;
                        familiare = false;
                      });
                    }),
                Text('Me'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: false,
                    tristate: false,
                    onChanged: (value) {
                      setState(() {
                        familiare = value!;
                        personale = false;
                      });
                    }),
                Text('Un Mio Familiare'),
              ],
            ), */

        SizedBox(
          height: 20,
        ),
        _value == 2
            ? Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                          '(Inserisci i dati del familiare per il quale richiedi il servizio)'),
                    ),
                    TextFormFieldCustom(
                      textEditingController: _nameAnotherController,
                      labelTextCustom: 'Nome e Cognome:',
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Richiesto*';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldCustom(
                      textEditingController: _telepAnotherController,
                      labelTextCustom: 'Telefono:',
                       keyboardType: TextInputType.phone,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Richiesto*';
                        } else if(value.isNotEmpty && value.length < 10) {
                          return 'Inserire un numero di telefono valido';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
