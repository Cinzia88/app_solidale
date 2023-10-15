import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';
import 'package:anf_app/screens/home/widget/custom_cards_sevice.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style.dart';
import 'offro aiuto/offro_aiuto_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
   {

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         BackgroundStyle(),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 4.5,
              right: 20,
              left: 20),
          child: Column(
            children: [
              CustomCardsService(context),
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorConstants.colorDoctNotActive,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            surfaceVariant: Colors.transparent,
                          ),
                    ),
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
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => OffroAiutoPage()));
                        },
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child:  Material(
                                elevation: 10,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30))),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: const Padding(
                                    padding:  EdgeInsets.only(top: 30.0, bottom: 10),
                                    child:  Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Vuoi offrire il tuo aiuto?',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25,
                                                    color: ColorConstants.titleText,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                                'Compila il form con i tuoi dati'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                width: 70,
                                child: Image.asset(
                                  PathConstants.onboarding4,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Vuoi sostenere l\'ANF?',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              primary: ColorConstants.primaryColor,
                              onPrimary: Colors.white),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'DONA ORA',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
