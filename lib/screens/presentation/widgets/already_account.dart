import 'package:anf_app/const/text_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';

Widget alreadyAccount() {
return RichText(
                  text: TextSpan(
                    text: TextConstants.alreadyHaveAccount,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "   ${TextConstants.signIn}",
                        style: const TextStyle(
                          color: ColorConstants.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //  bloc.add(SignInTappedEvent());
                          },
                      ),
                    ],
                  ),
                );
}