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
          top: MediaQuery.of(context).size.height / 3, right: 20, left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 40,
                    footer: Text(
                      "Il Tuo Profilo è Completo al 50%",
                      style: TextStyle(
                          color: ColorConstants.titleText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: ColorConstants.orangeGradients1,
                    progressColor: Color(0xFF933C15),
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
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text('Dati Anagrafici',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xFFEF6E31))),
                            ),
                          ],
                        ),
                        Text(
                            'Completa il tuo profilo con i tuoi dati anagrafici')
                      ],
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text('I Miei Documenti',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xFFEF6E31))),
                          ),
                        ],
                      ),
                      Text(
                      'In questa sezione puoi visionare i documenti inviati')
                    ],
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
