import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';
import '../../../const/path_constants.dart';
import '../page/chiedo_aiuto/prenotaz_servizi.dart';

Widget CustomCardsService(BuildContext context) {
    return Flexible(
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 20),
                    children:  [
                      Stack(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PrenotazioneServizio()));
                          },
                          child:  const Padding(
                            padding: EdgeInsets.only(top: 35.0),
                            child: Material(
                                elevation: 10,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                )),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        child: Text('Prenotazione Servizi',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: ColorConstants.titleText)),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Align(
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
                          padding: EdgeInsets.only(top: 35.0),
                          child: Material(
                              elevation: 10,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                              )),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: Text('Banco Alimentare',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: ColorConstants.titleText)),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        Align(
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
                );
  
}
