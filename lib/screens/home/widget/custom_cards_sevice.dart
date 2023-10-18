import 'package:flutter/material.dart';

import '../../../const/path_constants.dart';
import '../../common_widgets/custom_cards_common.dart';
import '../../presentation/widgets/custom_container_service.dart';

Widget customCardsService(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
            CustomCardsCommon(
              child: const CustomContainerService(
                title: 'Prenotazione Servizi',
                subtitle:
                    'Ti aiutiamo a raggiungere strutture e servizi primari',
                image: PathConstants.servziPrenot,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomCardsCommon(
              child: const CustomContainerService(
                title: 'Banco Alimentare',
                subtitle:
                    'Prenota o conferma il ritiro del tuo pacco alimentare',
                image: PathConstants.bancoAlim,
              ),
            ),
        ],
      ),
    );
  
}
