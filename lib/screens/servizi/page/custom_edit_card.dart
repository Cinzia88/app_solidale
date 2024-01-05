
import 'package:app_solidale/screens/servizi/page/custom_card.dart';
import 'package:app_solidale/screens/servizi/page/edit_taxi_solidale/edit_taxi_solidale.dart';
import 'package:flutter/material.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;



Widget customEditCardsServiceChiedoAiuto(BuildContext context) {
  List<String> serviceId = ['2', '3', '4'];

 
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40.0),
    child: ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: globals.listRequestData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            EditTaxiSolidale(globals.listRequestData[index],),
            customCardsServiceChiedoAiuto(context)
          ],
        );
      },
    ),
  );
}





