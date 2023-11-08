import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';

import 'package:app_solidale/screens/presentation/widgets/custom_container_service.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:flutter/material.dart';

import '../../../const/paypal_constants.dart';
import '../../signup/page/signup_page.dart';
import 'already_account.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String titleOffroAiuto = "Offro Aiuto";
  String titleChiedoAiuto = "Chiedo Aiuto";

  CustomCard({super.key});

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
                        context,
                        MaterialPageRoute(
                            builder: (_) => SignUpPage(
                                  service: titleOffroAiuto,
                                )));
                  },
                  child: CustomCardsCommon(
                    child: CustomContainerService(
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
                        context,
                        MaterialPageRoute(
                            builder: (_) => SignUpPage(
                                  service: titleChiedoAiuto,
                                )));
                  },
                  child: CustomCardsCommon(
                    child: CustomContainerService(
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
                CustomCardsCommon(child: alreadyAccount(context)),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Vuoi sostenere l\'ANF?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckout(
                sandboxMode: true,
                clientId: PaypalConstants.clientId,
                secretKey: PaypalConstants.secretKey,
                returnURL: "success.snippetcoder.com",
                cancelURL: "cancel.snippetcoder.com",
                transactions: const [
                  {
                    "amount": {
                      "total": '10.00',
                      "currency": "EUR",
                      "details": {
                        "subtotal": '10.00',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": [
                        {
                          "name": "Apple",
                          "quantity": 1,
                          "price": '10.00',
                          "currency": "EUR"
                        },
                        
                      ],

                      // shipping address is not required though
                         "shipping_address": {
                           "recipient_name": "Raman Singh",
                           "line1": "Delhi",
                           "line2": "",
                           "city": "Delhi",
                           "country_code": "IN",
                           "postal_code": "11001",
                           "phone": "+00000000",
                           "state": "Texas"
                        },
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                },
                onError: (error) {
                  print("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                },
              ),
            ));
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
                            fontSize: 18),
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
