import 'package:flutter/material.dart';

import '../../../const/path_constants.dart';
import '../../common_widgets/custom_cards_common.dart';
import '../../presentation/widgets/custom_container_service.dart';
import '../page/chiedo_aiuto/prenotaz_servizi.dart';

Widget customCardsService(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrenotazioneServizio()));
              },
              child: CustomCardsCommon(
                child: const CustomContainerService(
                  title: 'Servizi',
                  subtitle:
                      'Ti aiutiamo a raggiungere strutture e servizi primari',
                  image: PathConstants.servziPrenot,
                ),
              ),
            ),
            SizedBox(
              height: 40,
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
