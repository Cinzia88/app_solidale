import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/bloc/read_request_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/destinazione_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/edit_acc_onc/page_edit_destinatario.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/edit_acc_onc/page_edit_destinazione.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/disabili/edit_disabili/edit_disabili_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/widget/edit_data_destinatario.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

import '../../../../../../const/color_constants.dart';

class AccompagnamentoOncologicoEditPage extends StatefulWidget {
  @override
  State<AccompagnamentoOncologicoEditPage> createState() =>
      _AccompagnamentoOncologicoEditPageState();
}

class _AccompagnamentoOncologicoEditPageState
    extends State<AccompagnamentoOncologicoEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameAnotherController = TextEditingController();
  final TextEditingController _telepAnotherController = TextEditingController();
  int _value = 1;
  String idAccSolidaleEdit = '';
  bool? datiDestinazione;

  @override
  void initState() {
        EditDataTypeServiceRepository().getRequestData(context);

    super.initState();
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
                              print(state.errorMessage,);

              } else if (state is ReadRequestLoadedState) {
             
                EditDataTypeServiceRepository().getRequestData(context);
                for (int i = 0; i < globals.listRequestData.length; i++) {
                  if (globals.listRequestData[i].serviceId == '3' &&
                      globals.listRequestData[i].partenza != 'null' &&
                      globals.listRequestData[i].destinazione != 'null' &&
                      globals.listRequestData[i].data != 'null') {
                    setState(() {
                      datiDestinazione = true;
                    });
                  } else if (globals.listRequestData[i].serviceId == '3' &&
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
                                            PathConstants.accompagnamOncolog,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3 * blockSizeVertical,
                                        ),
                                        Text(
                                          'Accompagnamento Oncologico',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                        datiDestinazione == false 
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
                                                    AccompagnamentoOncologicoEditDestinatario()));
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
                                      height: 40,
                                    ),
                                     datiDestinazione == false
                                        ? GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DestinationEditPage()));
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
                                                          DestinationEditPage()));
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
                                      height: 60,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CommonStyleButton(
                                            title: 'Invia Richiesta',
                                            onTap: 
                                                    datiDestinazione == false 
                                                ? null
                                                :() {
                                              showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 50,
                                                            child: Image.asset(
                                                                PathConstants
                                                                    .accompagnamOncolog),
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
                                                            textAlign: TextAlign
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
                                                                .circular(20.0),
                                                      ),
                                                      actions: [
                                                        InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
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
                                                  .sendMailService(context,
                                                      'Accompagnamento Oncologico');

                                              FocusScope.of(context).unfocus();
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
}
