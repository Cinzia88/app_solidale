import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/const/text_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

 Widget createHaveAccountText(BuildContext context) {
   // final bloc = BlocProvider.of<SignUpBloc>(context);
    return RichText(
      text: TextSpan(
        text: TextConstants.alreadyHaveAccount,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        children: [
          TextSpan(
            text: " ${TextConstants.signIn}",
            style: TextStyle(
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