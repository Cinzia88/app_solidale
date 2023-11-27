import 'package:app_solidale/const/path_constants.dart';
import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';

Widget customAppBar(
    {required BuildContext context,
    }) {
  return  Container(
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
                ],
              ),
            );
}
