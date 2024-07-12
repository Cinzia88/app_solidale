import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/menu/messages/accompagnamento_oncologico/bloc/message_acc_bloc.dart';
import 'package:app_solidale/screens/menu/messages/accompagnamento_oncologico/repository/message_acc_repository.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/bloc/message_bloc.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/repository/message_repository.dart';
import 'package:app_solidale/screens/menu/messages/taxi_solidale/bloc/message_taxi_bloc.dart';
import 'package:app_solidale/screens/menu/messages/taxi_solidale/repository/message_taxi_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/background_style/custom_appbar.dart';

class SingleMessageAccPage extends StatefulWidget {
  @override
  State<SingleMessageAccPage> createState() => _SingleMessageAccPageState();
}

class _SingleMessageAccPageState extends State<SingleMessageAccPage> {
  int _value = 1;
  String idMessage = '';
  String data = '';
  String dataMessaggio = '';

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocProvider<MessageAccBloc>(
        create: (context) => MessageAccBloc(
            context: context,
            messageRepository: context.read<MessageAccRepository>())
          ..add(FetchMessageAccEvent()),
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
          body: BlocConsumer<MessageAccBloc, MessageAccState>(
              listener: (context, state) {
            if (state is MessageAccErrorState) {
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nessun Messaggio'),
                ],
              );
            } else if (state is MessageAccLoadedState) {
              idMessage = state.messages.id;
              data = state.messages.data;
              dataMessaggio = state.messages.messaggioRicevuto;

              if (state.messages.risposta == 'Riprogramma') {
                _value = 2;
              }
            } else if (state is EditMessageAccErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
            return;
          }, builder: (context, state) {
            return state is MessageAccLoadingState ||
                    state is EditMessageAccLoadingState
                ? loadingWidget(context)
                : idMessage == '' && data == ''
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Nessun Messaggio'),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Messaggio: Accompagnamento Oncologico',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2 * blockSizeVertical,
                                ),
                              ),
                               
                              _formSelectService(data),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CommonStyleButton(
                                      title: 'Invia',
                                      onTap: () {
                                        MessageAccRepository().editMessageAcc(
                                          context,
                                          idMessage,
                                          '4',
                                          data,
                                          _value == 1
                                              ? 'Confermata'
                                              : 'Riprogramma',
                                        );

                                        showDialog(
                                            barrierColor: Colors.black87,
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
                                                      'Messaggio Inviato',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      ))
                                                ],
                                              );
                                            });
                                        FocusScope.of(context).unfocus();
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
    String oraConsegna = DateFormat('HH:mm').format(DateTime.parse(
      dataConsegnaParam,
    ));
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Text(
              'Ciao, in seguito alla tua richiesta del servizio "Accompagnamento Oncologico", ti informiamo che sarà effettuato il giorno $dataConsegna alle ore $oraConsegna.',
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
      ),
    ]);
  }
}
