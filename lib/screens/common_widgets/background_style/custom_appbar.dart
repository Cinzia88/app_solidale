import 'package:anf_app/const/path_constants.dart';
import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';

Widget customAppBar({required BuildContext context, required bool arrow, required void Function()? onPressed}) {
  return Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
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
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
           
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Image.asset(
                  PathConstants.logoanfcompletoorizz,
                  width: 200,
                ),
              ),
            ),
             arrow == true
                ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: onPressed
                )
                : Text(''),
          ],
        ),
      ],
    ),
  );
}
