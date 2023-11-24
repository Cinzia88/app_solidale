// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCardsCommon extends StatelessWidget {
  Widget child;
  CustomCardsCommon({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 10,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(padding: const EdgeInsets.all(20.0), child: child)));
  }
}
