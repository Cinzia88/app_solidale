
import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';
import '../../../const/path_constants.dart';

Widget appBarPages(BuildContext context) {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        PathConstants.logoanfcompletoorizz,
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
}