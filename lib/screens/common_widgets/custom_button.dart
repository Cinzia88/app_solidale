import 'package:app_solidale/const/color_constants.dart';
import 'package:flutter/material.dart';

class CommonStyleButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Function() onTap;
  final Widget iconWidget;

  const CommonStyleButton(
      {super.key,
      required this.title,
      this.isEnabled = true,
      required this.onTap,
      required this.iconWidget});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: Text(title),
      icon: iconWidget,
    );
  }
}

class DangerStyleButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final Function() onTap;
  final Widget iconWidget;

  const DangerStyleButton(
      {super.key,
      required this.title,
      this.isEnabled = true,
      required this.onTap,
      required this.iconWidget});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: Text(title),
      icon: iconWidget,
      style: ElevatedButton.styleFrom(
          primary: Colors.red, onPrimary: Colors.white),
    );
  }
}
