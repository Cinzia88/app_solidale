
// ignore_for_file: must_be_immutable

import 'package:app_solidale/screens/profilo/page/dati_da_inserire/dati_anagrafici_form.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/dati_form_offro_aiuto.dart';
import 'package:flutter/material.dart';

import '../../../../const/color_constants.dart';
import '../home_offro_aiuto/offro aiuto/offro_aiuto_page.dart';
import 'custom_cards_sevice_chiedo_aiuto.dart';


class HomeChiedoAiuto extends StatelessWidget {
  String richiestaChiedoAiuto;
   HomeChiedoAiuto(this.richiestaChiedoAiuto);

  @override
  Widget build(BuildContext context) {
   final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
    shrinkWrap: true,        children: [
            Column(
              children: [
                 Text(
                 richiestaChiedoAiuto,
                  style:  TextStyle(
                      color: ColorConstants.titleText,
                      fontWeight: FontWeight.bold,
                      fontSize: 3 * blockSizeVertical),
                ),
                const Divider(
                  color: ColorConstants.orangeGradients3,
                ),
                customCardsServiceChiedoAiuto(context),
                

              ],
            ),
         
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text(
                    'Vuoi contribuire ad aiutare il prossimo?',
                    style: TextStyle(
                        color: ColorConstants.orangeGradients3,
                        fontWeight: FontWeight.bold,
                        fontSize: 2.0 * blockSizeVertical),
                  ),
                      const Divider(
                    color: ColorConstants.orangeGradients3,
                  ),
                  Text('Offri il tuo aiuto e condividi il tuo tempo.',  style: TextStyle(
                        fontSize: 2.0 * blockSizeVertical),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => FormProfilePage('Offro Aiuto')));
                      },
                        child: Text('Unisciti a noi', style: TextStyle( color: ColorConstants.orangeGradients3, fontSize: 2.0 * blockSizeVertical, fontWeight: FontWeight.bold),)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}