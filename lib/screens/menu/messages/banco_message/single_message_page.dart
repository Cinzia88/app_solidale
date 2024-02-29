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
  String date;
  String idMessage;
  String serviceId;

  SingleMessagePage({
    Key? key,
    required this.date,
    required this.idMessage,
    required this.serviceId,
  }) : super(key: key);

  @override
  State<SingleMessagePage> createState() => _SingleMessagePageState();
}

class _SingleMessagePageState extends State<SingleMessagePage> {
  int _value = 1;

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
            messageRepository: context.read<MessageRepository>())
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is MessageLoadedState) {
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
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.serviceId == '4'
                                ? 'Banco Alimentare'
                                : widget.serviceId == '3'
                                    ? 'Accompagnamento Oncologico'
                                    : widget.serviceId == '2'
                                        ? 'Taxi Solidale'
                                        : '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 2 * blockSizeVertical,
                            ),
                          ),
                          _formSelectService(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CommonStyleButton(
                                  title: 'Invia',
                                  onTap: () {
                                    MessageRepository().editMessage(
                                      context,
                                      widget.idMessage,
                                      widget.serviceId,
                                      '',
                                      widget.date,
                                      _value == 1
                                          ? 'Confermata'
                                          : 'Riprogramma',
                                      '',
                                      '',
                                    );

                                    showDialog(
                                        barrierColor: Colors.black87,
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Column(
                                              children: [
                                             widget.serviceId == '4' ?  SizedBox(
                                                  height: 50,
                                                  child: Image.asset(
                                                    PathConstants.bancoAlim),
                                                ) :  widget.serviceId == '3' ?  SizedBox(
                                                  height: 50,
                                                  child: Image.asset(
                                                    PathConstants.accompagnamOncolog),
                                                ) :  widget.serviceId == '2' ?  SizedBox(
                                                  height: 50,
                                                  child: Image.asset(
                                                    PathConstants.taxiSolidale),
                                                ) : SizedBox(),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Messaggio Inviato',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
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

  _formSelectService() {
    String dataConsegna = DateFormat('dd-MM-yyyy').format(DateTime.parse(
      widget.date,
    ));
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Text(
              widget.serviceId == '4'
                  ? 'Ciao, in seguito alla tua richiesta del servizio "Banco Alimentare", ti informiamo che la consegna del pacco è prevista per il giorno: $dataConsegna.'
                  : widget.serviceId == '3'
                      ? 'Ciao, in seguito alla tua richiesta del servizio "Accompagnamento Oncologico", ti informiamo che sarà effettuato il giorno: $dataConsegna.'
                      : widget.serviceId == '2'
                      ? 'Ciao, in seguito alla tua richiesta del servizio "Taxi Solidale", ti informiamo che sarà effettuato il giorno: $dataConsegna.'
                          : '',
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
