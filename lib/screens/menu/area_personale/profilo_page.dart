import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/service/service.dart';
import 'package:flutter/material.dart';

import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import '../../../const/color_constants.dart';
import '../../common_widgets/background_style/appbar_pages.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

// ignore: use_key_in_widget_constructors
class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Service sevice = Service();
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
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
           ),
            drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Area Personale',
                style: TextStyle(
                    color: ColorConstants.titleText,
                    fontWeight: FontWeight.bold,
                    fontSize: 3 * blockSizeVertical),
              ),
              const Divider(
                color: ColorConstants.orangeGradients3,
              ),
            
             
             const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                      CustomCardsCommon(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              const  Icon(
                                  Icons.person,
                                  color: ColorConstants.orangeGradients3,
                                ),
                                Text(' Modifica Dati',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2.5 * blockSizeVertical,
                                      color:
                                          ColorConstants.orangeGradients3,
                                    )),
                              ],
                            ),
                           const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Modifica i tuoi dati anagrafici',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                     
                  const SizedBox(
                    height: 40,
                  ),
                  CustomCardsCommon(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          const  Icon(
                              Icons.document_scanner,
                              color: ColorConstants.orangeGradients3,
                            ),
                            Text(' Documenti Inviati',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2.5 * blockSizeVertical,
                                  color: ColorConstants.orangeGradients3,
                                )),
                          ],
                        ),
                       const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Visulizza qui i tuoi documenti inviati',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Elimina Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 2.5 * blockSizeVertical,
                            color: ColorConstants.titleText),
                      ),
                    ],
                  ),
                const  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DangerStyleButton(
                          title: 'Rimuovi Account',
                          onTap: () {
                            sevice.deleteAccount(context);
                          },
                          iconWidget: const Icon(Icons.delete)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}