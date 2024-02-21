import 'dart:async';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:app_solidale/screens/slides/page/page.dart';

import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:app_solidale/service/service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:flutter/services.dart';

import '../../../const/color_constants.dart';
import '../../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  int splashTime = 3;
  ValueSharedPrefsViewSlide valueSharedPrefsViewSlide =
      ValueSharedPrefsViewSlide();
  Service service = Service();
   final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String? initialMessage;
  String _appBadgeSupported = 'Unknown';

  @override
  void initState() {
    super.initState();

    initializeFirebase();
    getValueViewSlide();
    getTokenUser();

    timer = Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            if (globals.viewSlide == false && globals.tokenValue == '' ||
                globals.tokenValue == null) {
              return SignInPage();
            } else if (globals.tokenValue != null &&
                globals.viewSlide == false) {
              return const PresentationPage();
            } else {
              return const SlidesPage();
            }
          },
        ),
      );
    });
  }
Future initializeFirebase() async {
    firebaseMessaging.subscribeToTopic('all');
  

    firebaseMessaging.getToken().then((token) {
      globals.tokenFCM = token!;
    print('globals.tokenFCM ${globals.tokenFCM}');
    } );
    FirebaseMessaging.instance.getInitialMessage().then(
          (value) {
            if(value != null) {
              showFlutterNotification(value);
            }
            
          }
          
          
        );

    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      showFlutterNotification(message);

    });
  }

  

 
  

  Future getValueViewSlide() async {
    final value = await valueSharedPrefsViewSlide.getValueViewSlide();
    setState(() {
      globals.viewSlide = value;
    });
  }

  Future getTokenUser() async {
    final value = await service.readToken();
    setState(() {
      globals.tokenValue = value;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            ColorConstants.orangeGradients1,
            ColorConstants.orangeGradients2,
            ColorConstants.orangeGradients3,
          ],
          begin: Alignment.topLeft,
          end: Alignment.center,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 200, child: Image.asset(PathConstants.logoanfcompleto))
            ],
          ),
        ),
      ),
    );
  }
}

class MessageArguments {
  /// The RemoteMessage
  final RemoteMessage message;

  /// Whether this message caused the application to open.
  final bool openedApplication;

  // ignore: public_member_api_docs
  MessageArguments(this.message, this.openedApplication);
}

/// Displays information about a [RemoteMessage].
class MessageView extends StatelessWidget {
  /// A single data row.
  Widget row(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title: '),
          Expanded(child: Text(value ?? 'N/A')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MessageArguments args =
        ModalRoute.of(context)!.settings.arguments! as MessageArguments;
    RemoteMessage message = args.message;
    RemoteNotification? notification = message.notification;

    return Scaffold(
      appBar: AppBar(
        title: Text(message.messageId ?? 'N/A'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            row('Triggered application open',
                args.openedApplication.toString()),
            row('Message ID', message.messageId),
            row('Sender ID', message.senderId),
            row('Category', message.category),
            row('Collapse Key', message.collapseKey),
            row('Content Available', message.contentAvailable.toString()),
            row('Data', message.data.toString()),
            row('From', message.from),
            row('Message ID', message.messageId),
            row('Sent Time', message.sentTime?.toString()),
            row('Thread ID', message.threadId),
            row('Time to Live (TTL)', message.ttl?.toString()),
            if (notification != null) ...[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Remote Notification',
                      style: TextStyle(fontSize: 18),
                    ),
                    row(
                      'Title',
                      notification.title,
                    ),
                    row(
                      'Body',
                      notification.body,
                    ),
                    if (notification.android != null) ...[
                      const SizedBox(height: 16),
                      const Text(
                        'Android Properties',
                        style: TextStyle(fontSize: 18),
                      ),
                      row(
                        'Channel ID',
                        notification.android!.channelId,
                      ),
                      row(
                        'Click Action',
                        notification.android!.clickAction,
                      ),
                      row(
                        'Color',
                        notification.android!.color,
                      ),
                      row(
                        'Count',
                        notification.android!.count?.toString(),
                      ),
                      row(
                        'Image URL',
                        notification.android!.imageUrl,
                      ),
                      row(
                        'Link',
                        notification.android!.link,
                      ),
                      row(
                        'Priority',
                        notification.android!.priority.toString(),
                      ),
                      row(
                        'Small Icon',
                        notification.android!.smallIcon,
                      ),
                      row(
                        'Sound',
                        notification.android!.sound,
                      ),
                      row(
                        'Ticker',
                        notification.android!.ticker,
                      ),
                      row(
                        'Visibility',
                        notification.android!.visibility.toString(),
                      ),
                    ],
                    if (notification.apple != null) ...[
                      const Text(
                        'Apple Properties',
                        style: TextStyle(fontSize: 18),
                      ),
                      row(
                        'Subtitle',
                        notification.apple!.subtitle,
                      ),
                      row(
                        'Badge',
                        notification.apple!.badge,
                      ),
                      row(
                        'Sound',
                        notification.apple!.sound?.name,
                      ),
                    ]
                  ],
                ),
              )
            ]
          ],
        ),
      )),
    );
  }
}
