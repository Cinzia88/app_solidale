
// ignore_for_file: must_be_immutable

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/widget/custom_card.dart';
import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';


class HomeChiedoAiuto extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
   //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Scaffold(
      appBar: AppBar(
           iconTheme: const IconThemeData(
            color: Colors.white,
           ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),
            actions: [
              IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.home, color: Colors.white,))
            ],),
            drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
           children: [
                Column(
                  children: [
                     Text(
                      'Chiedo Aiuto',
                      style:  TextStyle(
                          color: ColorConstants.titleText,
                          fontWeight: FontWeight.bold,
                          fontSize: 3 * blockSizeVertical),
                    ),
                    const Divider(
                      color: ColorConstants.orangeGradients3,
                    ),
                    customCardsServiceChiedoAiuto(context),
                  ],
                ),
             
              ],
            ),
          ),
      ),
    );
  }
}