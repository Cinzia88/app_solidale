import 'package:app_solidale/const/color_constants.dart';
import 'package:flutter/material.dart';
import '../main.dart';


class UtilsSnack {
  // ignore: body_might_complete_normally_nullable
 


   static String? showSnackBar(String? message, BuildContext? context, bool isError) {
    if (message == null) return null;
    @override
  

    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: isError ? Colors.red : ColorConstants.orangeGradients3,
      
    );

    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
    return null;
  }
}
