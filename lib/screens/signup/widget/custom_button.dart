import 'package:anf_app/const/color_constants.dart';
import 'package:flutter/material.dart';


class CommonStyleButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Function() onTap;

  CommonStyleButton({required this.title, this.isEnabled = true, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: Text(title),
      icon: Icon(Icons.person_add_alt),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        primary: ColorConstants.primaryColor,
        onPrimary: Colors.white
      ),
    );
      
  }
}
