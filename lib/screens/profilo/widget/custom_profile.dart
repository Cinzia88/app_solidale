import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../main.dart';
import '../page/dati_anagrafici_form.dart';

class CustomProfile extends StatefulWidget {
  const CustomProfile({super.key});

  @override
  State<CustomProfile> createState() => _CustomProfileState();
}

class _CustomProfileState extends State<CustomProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.5,
          right: 20,
          left: 20,
          bottom: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 40,
                    footer: const Text(
                      "Il Tuo Profilo è Completo al 50%",
                      style: TextStyle(
                          color: ColorConstants.titleText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: ColorConstants.orangeGradients1,
                    progressColor: const Color(0xFF933C15),
                    percent: percent,
                    center: const Material(
                      shape: CircleBorder(),
                      color: Color(0xFFf4a881),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FormProfilePage()));
              },
              child: CustomCardsCommon(
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: ColorConstants.orangeGradients3,
                              ),
                              Text('  Dati Anagrafici',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: ColorConstants.orangeGradients3,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Completa il tuo profilo con i tuoi dati',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: CustomCardsCommon(
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Icon(
                              Icons.document_scanner,
                              color: ColorConstants.orangeGradients3,
                            ),
                            Text('  I Miei Documenti',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFFEF6E31))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            'Carica i tuoi documenti',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: CustomCardsCommon(
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: ColorConstants.orangeGradients3,
                            ),
                            Text('  Modifica Dati',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFFEF6E31))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            'Modifica i tuoi dati',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double getPercent(int index) {
    switch (index) {
      case 0:
        return 0.50;
      case 1:
        return 0.50;
      default:
        return 0;
    }
  }
}
