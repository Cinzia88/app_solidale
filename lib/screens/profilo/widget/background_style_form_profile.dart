
import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';


// ignore: must_be_immutable
class BackgroundStyleProfile extends StatefulWidget {
  const BackgroundStyleProfile({super.key});

  @override
  State<BackgroundStyleProfile> createState() => _BackgroundStyleProfileState();
}

class _BackgroundStyleProfileState extends State<BackgroundStyleProfile> {
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
          child: const CloseButton(
            color: Colors.white,
          )
        ),
      ],
    );
  }

   

    
}


