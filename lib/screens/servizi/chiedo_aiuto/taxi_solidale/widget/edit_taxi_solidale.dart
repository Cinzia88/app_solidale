import 'dart:convert';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameAnotherController = TextEditingController();
  final TextEditingController _telepAnotherController = TextEditingController();
  int _value = 1;
  String idTaxiSolidaleEdit = '';

  @override
  void initState() {
    super.initState();
    getValueProfiloTaxiCompleto();
    getDisabiliData();
  }

  Future<DisabiliData> getDisabiliData() async {
    var url =
        '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/disabile/show/${globals.userData!.id}';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${globals.tokenValue}'
      },
    );
    var body = json.decode(response.body)[0];
    var data = DisabiliData.fromJson(body);
    globals.dataDisabili = data;
    print('disabili ${globals.dataDisabili}');
    switch (response.statusCode) {
      case 200:
        print('success data request');
      case 401:
        Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => PresentationPage()));

        break;
      case 400:
        String message = 'Utente non trovato';
        Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => PresentationPage()));
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )));
        break;
      case 500:
        String message = 'Errore Server: impossibile stabilire una connessione';
        Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => PresentationPage()));
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )));
        break;
      default:
        print('errore generico');
    }
    return data;
  }

  Future getValueProfiloTaxiCompleto() async {
    final value =
        await ValueSharedPrefsViewSlide().getProfiloIncompletoUtenteTaxi();
    setState(() {
      globals.profiloIncompletoTaxi = value;
    });

    print('profiloIncompletoTaxi ${globals.profiloIncompletoTaxi}');
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
                for (int i = 0; i < state.data.length; i++) {
                  if (state.data[i].nome != globals.userData!.nome &&
                      state.data[i].telefono != globals.userData!.telefono) {
                    _nameAnotherController.text = state.data[i].nome;
                    _telepAnotherController.text = state.data[i].telefono;
                  }
                  setState(() {
                    idTaxiSolidaleEdit = state.data[i].idRequest;
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
                                        globals.profiloIncompletoTaxi == true
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 40.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Richiesta Incompleta:',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '- Dati Disabilità Familiare Mancanti',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : SizedBox()
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
                                    const SizedBox(
                                      height: 60,
                                    ),
                                    GestureDetector(
                                      onTap: globals.profiloIncompletoTaxi ==
                                                  true &&
                                              globals.dataDisabili == null
                                          ? () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DisabiliTaxiPage()));
                                            }
                                          : globals.profiloIncompletoTaxi ==
                                                      true &&
                                                  globals.dataDisabili != null
                                              ? () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DisabiliTaxiPageEdit()));
                                                }
                                              : () {
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
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                      globals.profiloIncompletoTaxi ==
                                                                  true &&
                                                              globals.dataDisabili ==
                                                                  null
                                                          ? 'Aggiungi Dati Disabilità Familiare'
                                                          : globals.profiloIncompletoTaxi ==
                                                                      true &&
                                                                  globals.dataDisabili !=
                                                                      null
                                                              ? 'Modifica Dati Disabilità Familiare'
                                                              : 'Modifica Dati Disabilità Familiare',
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
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CommonStyleButton(
                                            title: 'Invia Richiesta',
                                            onTap:
                                                globals.profiloIncompletoTaxi ==
                                                        true
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
                                                                      height:
                                                                          50,
                                                                      child: Image.asset(
                                                                          PathConstants
                                                                              .taxiSolidale),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
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
                                                                      onTap:
                                                                          () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => PresentationPage()));
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Torna alla home',
                                                                        style: Theme.of(context)
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
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Richiesto*';
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
