import 'package:anf_app/main.dart';
import 'package:anf_app/screens/profilo/page/profile_page.dart';
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
          child: ProgressIndicatorProfile(pageIndex)
        ),
      ],
    );
  }

   

    
}


class ProgressIndicatorProfile extends StatefulWidget {
  int pageIndex;
   ProgressIndicatorProfile(this.pageIndex);

  @override
  State<ProgressIndicatorProfile> createState() => _ProgressIndicatorProfileState();
}

class _ProgressIndicatorProfileState extends State<ProgressIndicatorProfile> {
  @override
  Widget build(BuildContext context) {

    return CircularPercentIndicator(
      radius: 25,
      animationDuration: 1000,
      lineWidth: 5,
      animation: true,
      backgroundColor: ColorConstants.orangeGradients1,
      progressColor: Color(0xFF933C15),
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      center: GestureDetector(
        onTap:()=> Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfilePage(),
                ),
       ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(Icons.person, size: 25, color: Colors.white, ),
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
