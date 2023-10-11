import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';


// ignore: must_be_immutable
class BackgroundStyle extends StatelessWidget {
  const BackgroundStyle({super.key});

 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
}
