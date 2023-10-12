import 'package:anf_app/main.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../const/color_constants.dart';


// ignore: must_be_immutable
class BackgroundStyleHome extends StatefulWidget {
  const BackgroundStyleHome({super.key});

  @override
  State<BackgroundStyleHome> createState() => _BackgroundStyleHomeState();
}

class _BackgroundStyleHomeState extends State<BackgroundStyleHome> {
  final pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            height: size.height / 2.5,
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
          
        ),
         Positioned(
          top: MediaQuery.of(context).size.height / 15,
          left: MediaQuery.of(context).size.width / 1.28,
          child: const ProgressIndicatorProfile()
        ),
      ],
    );
  }

   

    
}


// ignore: must_be_immutable
class ProgressIndicatorProfile extends StatefulWidget {
  const ProgressIndicatorProfile({super.key});

  

  @override
  State<ProgressIndicatorProfile> createState() => _ProgressIndicatorProfileState();
}

class _ProgressIndicatorProfileState extends State<ProgressIndicatorProfile> {
  @override
  Widget build(BuildContext context) {

    return CircularPercentIndicator(
                    radius: 30,
                    
                    backgroundColor: ColorConstants.orangeGradients1,
                    progressColor: const Color(0xFF933C15),
                    percent: percent,
                    center: const Material(
                      shape: CircleBorder(),
                      color: Color(0xFFf4a881),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
  }
  double getPercent(int index) {
      switch (index) {
        case 0:
          return 0.50;
        case 1:
          return 0.50;
        default:
        return 0;
      }
    }
}
