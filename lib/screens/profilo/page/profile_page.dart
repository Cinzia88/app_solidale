import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/profilo/page/carica_documenti/page/carica_docs_page.dart';
import 'package:app_solidale/service/service.dart';
import 'package:flutter/material.dart';

import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../const/color_constants.dart';
import '../../common_widgets/background_style/appbar_pages.dart';
import 'cambio_password/page/cambio_password_page.dart';
import 'dati_da_inserire/dati_anagrafici_form.dart';
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
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
        child: appBarPages(context),
      ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    globals.profiloCompleto == true
                        ? "Il Tuo Profilo è Completo al 100%"
                        : "Il Tuo Profilo è Completo al 50%",
                    style: TextStyle(
                        color: ColorConstants.titleText,
                        fontSize: 2.5 * blockSizeVertical,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
             const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  globals.profiloCompleto == true
                      ? CustomCardsCommon(
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
                                    'Modifica il tuo profilo con i tuoi dati anagrafici',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      : GestureDetector(
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: FormProfilePage(''),
                              withNavBar: true,
                            );
                          },
                          child: CustomCardsCommon(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                  const  Icon(
                                      Icons.person,
                                      color: ColorConstants.orangeGradients3,
                                    ),
                                    Text('  Dati Anagrafici',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2.5 * blockSizeVertical,
                                          color:
                                              ColorConstants.orangeGradients3,
                                        )),
                                  ],
                                ),
                              const  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Completa il tuo profilo con i tuoi dati anagrafici',
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
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const CaricaDocsPage(),
                        withNavBar: true,
                      );
                    },
                    child: CustomCardsCommon(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            const  Icon(
                                Icons.document_scanner,
                                color: ColorConstants.orangeGradients3,
                              ),
                              Text('  Carica Documenti',
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
                                  'Carica qui i tuoi documenti e specifica il tipo di documento',
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
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const CambioPasswordPage(),
                        withNavBar: true,
                      );
                    },
                    child: CustomCardsCommon(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                           const   Icon(
                                Icons.password,
                                color: ColorConstants.orangeGradients3,
                              ),
                              Text('  Cambio Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2.5 * blockSizeVertical,
                                    color: ColorConstants.orangeGradients3,
                                  )),
                            ],
                          ),
                        const  Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  'Cambia la tua password corrente ed inserisci quella destinata a sostituirla. ',
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
