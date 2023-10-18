


import 'package:anf_app/const/path_constants.dart';
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
              children: [
                 arrow == true ?  IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
               onPressed: () {
                 Navigator.pop(context);
               },) : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
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
              ],
            ),
          );
}