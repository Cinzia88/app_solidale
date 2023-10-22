import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';
import '../../../const/path_constants.dart';

// ignore: must_be_immutable
class BackgroundStylePresentationPage extends StatefulWidget {
  Widget? iconBack;
  BackgroundStylePresentationPage({this.iconBack});

  @override
  State<BackgroundStylePresentationPage> createState() => _BackgroundStylePresentationPageState();
}

class _BackgroundStylePresentationPageState extends State<BackgroundStylePresentationPage> {
  final pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height / 3,
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
        widget.iconBack == null ? SizedBox() : widget.iconBack!,
        Container(
            height: 225,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                    child: Image.asset(PathConstants.logoanfcompleto,
                  width: 150,
                ),
                
                ),
                
              ],
            )),
      ],
    );
  }

 
}
