


import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';

Widget customAppBar(BuildContext context, bool arrow) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo_anf/logo-negativo.png',
                        width: 50,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                   const   Text(
                        'App Solidale',
                        style: TextStyle(
                            color: ColorConstants.colorLogo,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ],
                  ),
                ),
                arrow == true ?  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },),
                  ) : SizedBox(),
              ],
            ),
          );
}