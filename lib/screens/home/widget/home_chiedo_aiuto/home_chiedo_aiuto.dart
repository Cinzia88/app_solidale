
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../const/color_constants.dart';
import '../home_offro_aiuto/offro aiuto/offro_aiuto_page.dart';
import 'custom_cards_sevice.dart';


class HomeChiedoAiuto extends StatelessWidget {
  String richiestaChiedoAiuto;
   HomeChiedoAiuto(this.richiestaChiedoAiuto);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
    shrinkWrap: true,        children: [
            Column(
              children: [
                 Text(
                 richiestaChiedoAiuto,
                  style: const TextStyle(
                      color: ColorConstants.titleText,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const Divider(
                  color: ColorConstants.orangeGradients3,
                ),
                customCardsService(context),
                

              ],
            ),
         
            Column(
              children: [
                Text(
                  'Vuoi contribuire ad aiutare il prossimo?',
                  style: TextStyle(
                      color: ColorConstants.orangeGradients3,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                    const Divider(
                  color: ColorConstants.orangeGradients3,
                ),
                Text('Offri il tuo aiuto e condividi il tuo tempo.',),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => OffroAiutoPage()));
                    },
                      child: Text('Unisciti a noi', style: TextStyle(decoration: TextDecoration.underline,),)),
                  ],
                )
              ],
            ),
                 
          ],
        ),
      );
  }
}