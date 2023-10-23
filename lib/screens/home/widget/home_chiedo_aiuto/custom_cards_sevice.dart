import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../const/path_constants.dart';
import '../../../common_widgets/custom_cards_common.dart';
import '../../../presentation/widgets/custom_container_service.dart';
import 'chiedo_aiuto/prenotaz_servizi.dart';

Widget customCardsService(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: PrenotazioneServizio(),
              withNavBar: true,
            );
          },
          child: CustomCardsCommon(
            child: const CustomContainerService(
              title: 'Taxi Solidale',
              subtitle: 'Ti aiutiamo a raggiungere strutture e servizi primari',
              image: PathConstants.taxiSolidale,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
         GestureDetector(
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: PrenotazioneServizio(),
              withNavBar: true,
            );
          },
          child: CustomCardsCommon(
            child: const CustomContainerService(
              title: 'Accompagnamento Oncologico',
              subtitle: 'Ti aiutiamo a raggiungere strutture e servizi primari',
              image: PathConstants.accompagnamOncolog,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        CustomCardsCommon(
          child: const CustomContainerService(
            title: 'Banco Alimentare',
            subtitle: 'Prenota o conferma il ritiro del tuo pacco alimentare',
            image: PathConstants.bancoAlim,
          ),
        ),
      ],
    ),
  );
}
