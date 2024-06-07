import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/bloc/message_bloc.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/repository/message_repository.dart';
import 'package:app_solidale/screens/menu/messages/questionario/bloc/message_bloc.dart';
import 'package:app_solidale/screens/menu/messages/questionario/repository/message_notification_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/background_style/custom_appbar.dart';

class SingleMessageNotificationPage extends StatefulWidget {
  @override
  State<SingleMessageNotificationPage> createState() =>
      _SingleMessageNotificationPageState();
}

class _SingleMessageNotificationPageState
    extends State<SingleMessageNotificationPage> {
  int _value = 1;
  String idMessage = '';
  String title = '';
  String body = '';
  String dataMessaggio = '';

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocProvider<MessageNotificationBloc>(
        create: (context) => MessageNotificationBloc(
            context: context,
            messageRepository: context.read<MessageNoticationRepository>())
          ..add(FetchMessageNoticationEvent()),
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
          body: BlocConsumer<MessageNotificationBloc, MessageNotificationState>(
              listener: (context, state) {
            if (state is MessageNotificationErrorState) {
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nessun Messaggio'),
                ],
              );
            } else if (state is MessageNotificationLoadedState) {
              idMessage = state.messages.id;
              title = state.messages.title;
              body = state.messages.body;
              dataMessaggio = state.messages.messaggioRicevuto;
            }
            return;
          }, builder: (context, state) {
            return state is MessageLoadingState ||
                    state is EditMessageLoadingState
                ? loadingWidget(context)
                : idMessage == ''
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
                                'Messaggio: Questionario',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2 * blockSizeVertical,
                                ),
                              ),
                              Text(
                                DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                  dataMessaggio,
                                )),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2 * blockSizeVertical,
                                ),
                              ),
                              _startQuestionary(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CommonStyleButton(
                                      title: 'Invia',
                                      onTap: () {
                                        

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
                                                              .bancoAlim),
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

  _startQuestionary() {
    
   
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Text(
              'Ti informiamo che dovrai compilare un questionario',
            ),
            Text(
                'Clicca "Inizia Questionario" per compilare il form sul nostro sito')
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