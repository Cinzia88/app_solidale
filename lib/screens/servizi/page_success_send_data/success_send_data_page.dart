


import 'package:flutter/material.dart';

import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';

class SuccessSendDataPage extends StatelessWidget {
  String titleService;
  String image;
  String message;
   SuccessSendDataPage({
    Key? key,
    required this.titleService,
    required this.image,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return  Scaffold(
       appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),
           
          ),
                drawer: NavigationDrawerWidget(),
                body:  Stack(
                    children: [
                      SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(
                    20.0,
                  ),
                  child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                           
                            children: [
                              SizedBox(
                                width: 70,
                                child: Image.asset(
                                  image,
                                ),
                              ),
                              SizedBox(
                                height: 3 * blockSizeVertical,
                              ),
                              Text(
                                titleService,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                             
                              
                              
                            ],
                          ),
                        ],
                      ),
                      
                    
                  ),
    ),
    Align(
      alignment: Alignment.center,
      child: Text(message)),
                             ]),

    );
  }
}
