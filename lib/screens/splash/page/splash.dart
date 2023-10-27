import 'dart:async';
import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/onboarding/page/onboarding_page.dart';
import 'package:flutter/material.dart';


import '../../../const/color_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  int splashTime = 3;
  

  @override
  void initState() {
    super.initState();
   
    
    Timer(
        const Duration(seconds: 5),
        () { 
          
          Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  OnboardingPage(),),
            
            );
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
                width: 200,
                child: Image.asset(PathConstants.logoanfcompleto))
              
            ],
          ),
        ),
      ),
    );
  }
}