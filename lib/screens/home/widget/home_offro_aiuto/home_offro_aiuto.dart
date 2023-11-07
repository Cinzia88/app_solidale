
import 'package:app_solidale/screens/home/widget/home_offro_aiuto/offro%20aiuto/custom_cards_service_offro_aiuto.dart';
import 'package:flutter/material.dart';

import '../../../../const/color_constants.dart';

// ignore: must_be_immutable
class HomeOffroAiuto extends StatelessWidget {
   String richiestaOffroAiuto;
  HomeOffroAiuto(
    this.richiestaOffroAiuto,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
    shrinkWrap: true,        children: [
            Column(
              children: [
                 Text(
                 richiestaOffroAiuto,
                  style: const TextStyle(
                      color: ColorConstants.titleText,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const Divider(
                  color: ColorConstants.orangeGradients3,
                ),
                customCardsServiceOffroAiuto(context),
                

              ],
            ),
         
           
          ],
        ),
      );
  }
}
