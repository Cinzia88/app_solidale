import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';
import 'package:anf_app/screens/home/widget/background_style_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
      child: Stack(
        children: [
          const BackgroundStyleHome(),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3.5,
                right: 20,
                left: 20),
            child: Column(
              children: [
                Flexible(
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 20),
                    children: [
                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Material(
                              elevation: 10,
                              color: const Color(0xFFFFFFFF),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Flexible(
                                      child: Text('Prenotazione Servizi',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color(0xFFEF6E31))),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        const Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              child: CircleAvatar(
                                radius: 38.0,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage(PathConstants.login),
                              ),
                            )),
                      ]),
                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Material(
                              elevation: 10,
                              color: const Color(0xFFFFFFFF),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Flexible(
                                      child: Text('Banco Alimentare',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color(0xFFEF6E31))),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        const Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              child: CircleAvatar(
                                radius: 38.0,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage(PathConstants.login),
                              ),
                            )),
                      ]),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: ColorConstants.titleText,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            ColorConstants.orangeGradients1,
                            ColorConstants.orangeGradients2,
                          ]),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        tabs: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Offro Aiuto',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Donazioni',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ]),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: TabBarView(
                      children: [
                        Stack(
                          children: [
                            CustomCardsCommon(child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                  'Vuoi offrire il tuo aiuto?',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color:
                                                          Color(0xFFEF6E31))),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: 150,
                                                child: Text(
                                                    'Compila il form con i tuoi dati anagrafici')),
                                          ],
                                        )
                                      ],
                                    ),),
                            
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 100,
                                child: Image.asset(
                                  PathConstants.login,
                                ),
                              ),
                            )
                          ],
                        ),
                        Stack(
                          children: [
                            CustomCardsCommon(child:  Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                  'Vuoi sostenere l\'ANF?',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color:
                                                          Color(0xFFEF6E31))),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: 150,
                                                child: Text(
                                                    'Dona ora per il tuo contibuto volontario')),
                                          ],
                                        )
                                      ],
                                    ),),
                            
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 100,
                                child: Image.asset(
                                  PathConstants.login,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
