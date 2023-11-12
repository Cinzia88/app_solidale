import 'dart:async';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/onboarding/page/onboarding_page.dart';
import 'package:app_solidale/screens/presentation/page/presentation_page.dart';
import 'package:app_solidale/screens/tabs/page/page_tabs.dart';
import 'package:app_solidale/secure_storage/secure_storage.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:app_solidale/service/service.dart';
import 'package:flutter/material.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;


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


  @override
  void initState() {
    super.initState();
getUserId();
  
    getValueViewSlide();
    getTokenUser();

    timer = Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)  {
            print('valueToken ${globals.tokenValue}');
            print('valueViewSlide${globals.viewSlide}');
            print('userId${globals.userId}');
            print('userIdNull${globals.userIdNull}');

            if (globals.viewSlide == false && globals.tokenValue == '' || globals.tokenValue == null ) {
              return const PresentationPage();
            } else if (globals.tokenValue != null && globals.userId != null &&
                globals.viewSlide == false) {
              return TabsPage();
            } else if (globals.userIdNull == null &&
                globals.viewSlide == false) {
              return PresentationPage();
            } else {
              return OnboardingPage();
            }
          },
        ),
      );
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

Future getUserId() async {
    final value = await valueSharedPrefsViewSlide.getuserId();
    setState(() {
      globals.userId = value;
    });
     await valueSharedPrefsViewSlide.removeuserId;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF063d5e),
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