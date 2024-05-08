import 'dart:async';
import 'dart:io';
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
import 'package:flutter/widgets.dart';

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

    if (Platform.isIOS) {
      await FirebaseMessaging.instance.getAPNSToken();
    } else {}
    firebaseMessaging.getToken().then((token) {
      globals.tokenFCM = token!;
      print('globals.tokenFCMAndroid ${globals.tokenFCM}');
      print('tokenFCMAndroid ${token}');
    });

    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        showFlutterNotification(value);
      }
    });

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 50,  child: Image.asset(PathConstants.anfvet)),
            SizedBox(width: 50,  child: Image.asset(PathConstants.regpug)),
            SizedBox(width: 50,  child: Image.asset(PathConstants.minlav)),
          ],
        ),
      ),
    );
  }
}
