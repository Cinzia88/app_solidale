
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class UiHelperPaypal {
  static showAlertDialog(BuildContext context, String message, {title = ''}) {
   

      OneContext().showDialog(
                        barrierColor: Colors.black87,

        builder: (ctx) {
 
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          actions: [
            ElevatedButton(onPressed: () => Navigator.pop(ctx), child: Text('Ok'))
          ],
        );
      });
      
  }
}