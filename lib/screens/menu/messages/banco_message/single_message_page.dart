import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/bloc/message_bloc.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/repository/message_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/background_style/custom_appbar.dart';

class SingleMessagePage extends StatefulWidget {
  @override
  State<SingleMessagePage> createState() => _SingleMessagePageState();
}

class _SingleMessagePageState extends State<SingleMessagePage> {
  int _value = 1;
  String idMessage = '';
  String dataInvio = '';
  String dataConsegna = '';
  String dataMessaggio = '';
  String rispostaMessaggio = '';

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;

    return BlocProvider<MessageBloc>(
        create: (context) => MessageBloc(
            context: context,
            messageRepository: context.read<MessageBancoRepository>())
          ..add(FetchMessageEvent()),
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
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ))
            ],
          ),
          drawer: NavigationDrawerWidget(),
          body: BlocConsumer<MessageBloc, MessageState>(
              listener: (context, state) {
            if (state is MessageErrorState) {
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nessun Messaggio'),
                ],
              );
            } else if (state is MessageLoadedState) {
              idMessage = state.messages.id;
              dataInvio = state.messages.dataInvio;
              dataConsegna = state.messages.dataConsegna;
              dataMessaggio = state.messages.messaggioRicevuto;
              rispostaMessaggio = state.messages.risposta!;
              if (state.messages.risposta == 'Riprogramma') {
                _value = 2;
              }
            } else if (state is EditMessageErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
            return;
          }, builder: (context, state) {
            return state is MessageLoadingState ||
                    state is EditMessageLoadingState
                ? loadingWidget(context)
                : idMessage == '' && dataConsegna == ''
                    ? Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Messaggio: Banco Alimentare',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2 * blockSizeVertical,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Nessun Messaggio',
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : rispostaMessaggio == 'Confermata'
                        ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Messaggio: Banco Alimentare',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2 * blockSizeVertical,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  'Hai confermato la consegna prevista per la data ${DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                dataConsegna,
                              ))}.'),
                            ],
                          ),
                        )
                        : rispostaMessaggio == 'Riprogramma'
                            ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Messaggio: Banco Alimentare',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 2 * blockSizeVertical,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                      'Hai riprogrammato la consegna prevista per la data ${DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                dataConsegna,
                              ))}.\nRiceverai un altro messaggio per "Confermare" oppure "Riprogrammare" la data che ti comunicheremo.'),
                                ],
                              ),
                            )
                            : SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Messaggio: Banco Alimentare',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2 * blockSizeVertical,
                                        ),
                                      ),
                                      _formSelectService(dataConsegna),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CommonStyleButton(
                                              title: 'Invia',
                                              onTap: () {
                                                MessageBancoRepository()
                                                    .editMessageBanco(
                                                  context,
                                                  idMessage,
                                                  '4',
                                                  dataInvio,
                                                  dataConsegna,
                                                  _value == 1
                                                      ? 'Confermata'
                                                      : 'Riprogramma',
                                                  '',
                                                );

                                                showDialog(
                                                    barrierColor:
                                                        Colors.black87,
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
                                                                      .bancoAlim),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              'Messaggio Inviato',
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
                                                FocusScope.of(context)
                                                    .unfocus();
                                              },
                                              iconWidget: Text('')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
          }),
        ));
  }

  _formSelectService(String dataConsegnaParam) {
    String dataConsegna = DateFormat('dd-MM-yyyy').format(DateTime.parse(
      dataConsegnaParam,
    ));
    /* String oraConsegna = DateFormat('HH:mm').format(DateTime.parse(
      dataConsegnaParam,
    )); */
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Text(
              'Ti informiamo che la consegna del pacco alimentare da parte dell\' ANF sarà effettuata nella giornata di $dataConsegna.',
            ),
            Text(
                'Clicca "Conferma" per confermare questa data, oppure clicca "Riprogramma" se preferisci una data diversa che ti comunicheremo.')
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
          Text('Conferma'),
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
          Text('Riprogramma'),
        ],
      )
    ]);
  }
}
/* : widget.serviceId == '3'
                      ? 'Ciao, in seguito alla tua richiesta del servizio "Accompagnamento Oncologico", ti informiamo che sarà effettuato il giorno: $dataConsegna.'
                      : widget.serviceId == '2'
                      ? 'Ciao, in seguito alla tua richiesta del servizio "Taxi Solidale", ti informiamo che sarà effettuato il giorno: $dataConsegna.'
                          : '' */