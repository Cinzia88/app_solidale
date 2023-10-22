import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';

import 'package:anf_app/screens/presentation/widgets/custom_container_service.dart';
import 'package:anf_app/screens/presentation/widgets/donation_anf.dart';

import 'package:flutter/material.dart';

import '../../signup/page/signup_page.dart';
import 'already_account.dart';

class CustomCard extends StatelessWidget {
  String titleOffroAiuto = "Offro Aiuto";
    String titleChiedoAiuto = "Chiedo Aiuto";


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.5,
          right: 20,
          left: 20,
          bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUpPage(
                         service: titleOffroAiuto,
                        )));
                  },
                  child: CustomCardsCommon(
                    child:  CustomContainerService(
                      title: titleOffroAiuto,
                      subtitle:
                          'Crea il tuo Account per donare il tuo tempo ad ANF',
                      image: PathConstants.offroAiuto,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUpPage(
                          service: titleChiedoAiuto,
                        )));
                  },
                  child: CustomCardsCommon(
                    child:  CustomContainerService(
                      title: titleChiedoAiuto,
                      subtitle:
                          'Crea il tuo Account per usufruire dei servizi ANF',
                      image: PathConstants.onboarding3,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomCardsCommon(
                  child: alreadyAccount(context)
                ),
              ],
            ),
          ),
          donationAnf(context),
        ],
      ),
    );
  }
}
