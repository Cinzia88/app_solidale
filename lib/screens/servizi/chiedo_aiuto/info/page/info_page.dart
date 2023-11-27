

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:flutter/material.dart';

class PageInfo extends StatelessWidget {
  final String infoTitle;
  final String infoDescription;
  final Widget widgetButton;
  const PageInfo({required this.infoTitle, required this.infoDescription,  required this.widgetButton});

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
            actions: [ IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: Colors.white,))
            ],
            ),
                       drawer: NavigationDrawerWidget(),
            
           
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
              Column(
                children: [
                   Text(
                    infoTitle,
                    style:  TextStyle(
                        color: ColorConstants.titleText,
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * blockSizeVertical),
                                   ),
                  const Divider(
                    color: ColorConstants.orangeGradients3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(infoDescription,
textAlign: TextAlign.justify,
 style: TextStyle(
                      fontSize: 2.2 * blockSizeVertical,
                    ),),
                
                ],
              ),

              widgetButton
         ],
         
          ),)        
                
      
    );
  }
}