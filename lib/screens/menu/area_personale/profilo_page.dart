import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/home/widgets/custom_cards.dart';
import 'package:app_solidale/screens/menu/area_personale/cambio_password/page/cambio_password_page.dart';
import 'package:app_solidale/screens/menu/area_personale/lista_docs_inviati/page/docs_list_page.dart';
import 'package:app_solidale/screens/menu/area_personale/modifca_dati/page/modifica_dati_page.dart';
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
                'Il Mio Account',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Divider(
                color: ColorConstants.orangeGradients3,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModificaDatiPage()));
                    },
                    child: CustomCardsCommon(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.person,
                                color: ColorConstants.orangeGradients3,
                              ),
                              Text(' Modifica Dati',
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
                                  'Modifica i tuoi dati anagrafici',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListDocsPage()));
                    },
                    child: CustomCardsCommon(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.document_scanner,
                                color: ColorConstants.orangeGradients3,
                              ),
                              Text(' Documenti Inviati',
                                                         style: Theme.of(context).textTheme.titleSmall,
),
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
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CambioPasswordPage()));
                    },
                    child: CustomCardsCommon(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.password,
                                color: ColorConstants.orangeGradients3,
                              ),
                              Text(' Cambio Password',
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
                                  'Cambia la tua passord attuale',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      sevice.deleteAccount(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red, onPrimary: Colors.white),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Rimuovi Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 2 * blockSizeVertical),
                          ),
                        ]),
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
