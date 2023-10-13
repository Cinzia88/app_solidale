import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';
import 'package:anf_app/screens/signin/page/signin_page.dart';
import 'package:anf_app/screens/signup/page/signup_page.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';
import '../../../const/text_constants.dart';

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
          Column(
            children: [
              CustomCardsCommon(
                child: Row(
                  children: [
                    const Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Offro Aiuto',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color(0xFFEF6E31),
                                ),
                              ),
                            ],
                          ),
                          Text(
                              'Crea il tuo Account per offrire un tuo servizio ad ANF Famiglie'),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 70,
                        child: Image.asset(
                          PathConstants.onboarding4,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomCardsCommon(
                child: Row(
                  children: [
                    const Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Chiedo Aiuto',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color(0xFFEF6E31),
                                ),
                              ),
                            ],
                          ),
                          Text(
                              'Crea il tuo Account per usufruire dei servizi di ANF Famiglie'),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 70,
                        child: Image.asset(
                          PathConstants.onboarding3,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomCardsCommon(
                child: RichText(
                  text: TextSpan(
                    text: TextConstants.alreadyHaveAccount,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "   ${TextConstants.signIn}",
                        style: const TextStyle(
                          color: ColorConstants.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //  bloc.add(SignInTappedEvent());
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Vuoi sostenere l\'ANF?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignInPage()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    primary: ColorConstants.primaryColor,
                    onPrimary: Colors.white),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    'DONA ORA',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  )
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
