import 'dart:async';
import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/onboarding/page/onboarding_page.dart';
import 'package:anf_app/screens/presentation/page/presentation_page.dart';
import 'package:anf_app/screens/tabs/page/page_tabs.dart';
import 'package:anf_app/secure_storage/shared_prefs.dart';
import 'package:anf_app/service/service.dart';
import 'package:flutter/material.dart';
import 'package:anf_app/globals_variables/globals_variables.dart' as globals;

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

    getValueViewSlide();
    getTokenUser();

    timer = Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            print('valueToken ${globals.tokenValue}');
            print('valueViewSlide${globals.viewSlide}');

            if (globals.viewSlide == false && globals.tokenValue == '') {
              return const PresentationPage();
            } else if (globals.tokenValue != null &&
                globals.viewSlide == false) {
              return TabsPage();
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
