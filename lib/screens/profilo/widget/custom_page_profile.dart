import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';

import 'package:anf_app/screens/profilo/page/dati_da_inserire/dati_anagrafici_form.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../const/color_constants.dart';
import '../page/modifica_dati.dart';

class CustomCardProfile extends StatelessWidget {
  const CustomCardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 3.5,
        right: 20,
        left: 20,
      ),
      child: Column(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                      "Il Tuo Profilo è Completo al 50%",
                      style: TextStyle(
                          color: ColorConstants.titleText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                GestureDetector(
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
                        Row(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditFormProfilePage()));
                  },
                  child: CustomCardsCommon(
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.edit,
                              color: ColorConstants.orangeGradients3,
                            ),
                            Text('  Modifica Il Tuo Profilo',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorConstants.orangeGradients3,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Modifica i tuoi dati e visualizza la lista dei documenti caricati',
                              ),
                            ),
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
