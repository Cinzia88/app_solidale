import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/menu/messages/accompagnamento_oncologico/single_message_page.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/single_message_page.dart';
import 'package:app_solidale/screens/menu/messages/questionario/single_message_page.dart';
import 'package:app_solidale/screens/menu/messages/taxi_solidale/single_message_page.dart';
import 'package:flutter/material.dart';
import '../../../const/color_constants.dart';

// ignore: must_be_immutable
class MessagesPage extends StatefulWidget {
  String serviceNotification;
  MessagesPage({super.key, required this.serviceNotification});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  bool isMessageRead = false;

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 75.0,
          automaticallyImplyLeading: true,
          flexibleSpace: customAppBar(context: context),
        ),
        drawer: NavigationDrawerWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Messaggi',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const Divider(
                  color: ColorConstants.orangeGradients3,
                ),
                GestureDetector(
                   onTap: () {
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleMessageTaxiPage()));
                      },
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(PathConstants.taxiSolidale),
                                maxRadius: 18,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Taxi Solidale',
                                        style: TextStyle(
                                            color:
                                                ColorConstants.orangeColorScheme,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                     'Leggi Messaggio',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: false,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade600,
                                            fontWeight:
                                                  widget.serviceNotification ==
                                                'Accompagnamento Oncologico' &&  widget.serviceNotification ==
                                                'Banco Alimentare' &&  widget.serviceNotification ==
                                                'Taxi Solidale'
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector( onTap: () {
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleMessageAccPage()));
                      },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(PathConstants.accompagnamOncolog),
                                maxRadius: 18,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Accompagnamento Oncologico',
                                        style: TextStyle(
                                            color:
                                                ColorConstants.orangeColorScheme,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Leggi Messaggio',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: false,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade600,
                                            fontWeight:     widget.serviceNotification ==
                                                'Accompagnamento Oncologico' &&  widget.serviceNotification ==
                                                'Banco Alimentare' &&  widget.serviceNotification ==
                                                'Taxi Solidale'
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleMessagePage()));
                      },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(PathConstants.bancoAlim),
                                maxRadius: 18,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Banco Alimentare',
                                        style: TextStyle(
                                            color:
                                                ColorConstants.orangeColorScheme,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                         'Leggi Messaggio',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: false,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade600,
                                            fontWeight:
                                                 widget.serviceNotification ==
                                                'Accompagnamento Oncologico' &&  widget.serviceNotification ==
                                                'Banco Alimentare' &&  widget.serviceNotification ==
                                                'Taxi Solidale' 
                                           
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector( onTap: () {
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleMessageNotificationPage()));
                      },
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                            const  CircleAvatar(
                              backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage(PathConstants.logoanf),
                                maxRadius: 18,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Inizia Questionario',
                                        style: TextStyle(
                                            color:
                                                ColorConstants.orangeColorScheme,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Leggi Messaggio',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: false,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey.shade600,
                                            fontWeight:     widget.serviceNotification ==
                                                'Accompagnamento Oncologico' &&  widget.serviceNotification ==
                                                'Banco Alimentare' &&  widget.serviceNotification ==
                                                'Taxi Solidale'
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


/*Text(
                          DateFormat.MMMd('it_IT')
                              .format(DateTime.parse(
                            'messagesAll[index].dataConsegna',
                          )),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: isMessageRead == false
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ), */



/* CachedNetworkImage(
                  imageUrl: images[0],
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                    height: 100,
                    child: CupertinoActivityIndicator(
                      color: Color(0xff003b5b),
                    ),
                  )),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 60,
                    child: Image.asset(
                      'lib/resources/images/logo.png',
                    ),
                  ),
                ), */