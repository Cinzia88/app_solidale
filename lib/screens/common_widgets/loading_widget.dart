import 'package:anf_app/const/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget loadingWidget(BuildContext  context) {
  return Container(
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
    child: const Center(child: CupertinoActivityIndicator(color: ColorConstants.orangeGradients3),));
}