import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/home/widget/home_chiedo_aiuto/chiedo_aiuto/prenotaz_servizi.dart';
import 'package:app_solidale/screens/presentation/widgets/custom_container_service.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';



Widget customCardsServiceOffroAiuto(BuildContext context) {
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
               title: 'Banco del          Farmaco',
            subtitle: 'Prenota o conferma il ritiro del tuo pacco alimentare',
              image: PathConstants.taxiSolidale,
            ),
          ),
        ),
        

      ],
    ),
  );
}
