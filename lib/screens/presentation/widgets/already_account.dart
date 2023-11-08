import 'package:app_solidale/const/text_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';
import '../../signin/page/signin_page.dart';

Widget alreadyAccount(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
return RichText(
                  text: TextSpan(
                    text: TextConstants.alreadyHaveAccount,
                    style:  TextStyle(
                      color: Colors.black,
                      fontSize: 2 * blockSizeVertical,
                    ),
                    children: [
                      TextSpan(
                        text: "   ${TextConstants.signIn}",
                        style:  TextStyle(
                          color: ColorConstants.primaryColor,
                          fontSize: 2.5 * blockSizeVertical,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                            //  bloc.add(SignInTappedEvent());
                          },
                      ),
                    ],
                  ),
                );
}