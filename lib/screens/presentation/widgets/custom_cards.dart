import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';

import 'package:anf_app/screens/presentation/widgets/custom_container_service.dart';
import 'package:anf_app/screens/presentation/widgets/donation_anf.dart';
import 'package:anf_app/screens/signup/page/signup_page.dart';

import 'package:flutter/material.dart';

import 'already_account.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

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
                        context, MaterialPageRoute(builder: (_) => SignUpPage()));
                  },
                  child: CustomCardsCommon(
                    child: const CustomContainerService(
                      title: 'Offro Aiuto',
                      subtitle:
                          'Crea il tuo Account per offrire un tuo servizio ad ANF Famiglie',
                      image: PathConstants.onboarding4,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUpPage()));
                  },
                  child: CustomCardsCommon(
                    child: const CustomContainerService(
                      title: 'Chiedo Aiuto',
                      subtitle:
                          'Crea il tuo Account per usufruire dei servizi di ANF Famiglie',
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
