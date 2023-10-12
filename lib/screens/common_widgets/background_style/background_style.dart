import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../const/color_constants.dart';


// ignore: must_be_immutable
class BackgroundStyle extends StatefulWidget {
  const BackgroundStyle({super.key});

  @override
  State<BackgroundStyle> createState() => _BackgroundStyleState();
}

class _BackgroundStyleState extends State<BackgroundStyle> {
  final pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final percent = getPercent(pageIndex);
    return Container(
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
