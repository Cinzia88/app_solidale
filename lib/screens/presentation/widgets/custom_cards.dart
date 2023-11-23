import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/presentation/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/presentation/widgets/payment_form.dart';
import 'package:flutter/material.dart';
import '../../signup/page/signup_page.dart';
import 'already_account.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String titleOffroAiuto = "Offro Aiuto";
  String titleChiedoAiuto = "Chiedo Aiuto";

  CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 3.5,
            right: 20,
            left: 20,
            bottom: 20),
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
            SizedBox(
              height: 10 * blockSizeVertical,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Vuoi sostenere l\'ANF?',
                  style: TextStyle(color: Colors.black, fontSize: 2 * blockSizeVertical),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => DonazioniPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      primary: ColorConstants.primaryColor,
                      onPrimary: Colors.white),
                  child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DONA ORA',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 2.5 * blockSizeVertical),
                        )
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class DonazioniPage extends StatefulWidget {
  const DonazioniPage({super.key});

  @override
  State<DonazioniPage> createState() => _DonazioniPageState();
}

class _DonazioniPageState extends State<DonazioniPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => 
          Navigator.pop(context,), arrow: true )),
          body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaymentForm(),
                  ],
                ),
              ),
            ),
    );
  }
}

/*Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => UsePaypal(
                        sandboxMode: true,
                        clientId: PaypalConstants.clientId,
                        secretKey: PaypalConstants.secretKey,
                        returnURL: "https://samplesite.com/return",
                        cancelURL: "https://samplesite.com/cancel",
                        transactions: const [
                          {
                            "amount": {
                              "total": '1.00',
                              "currency": "EUR",
                              "details": {
                                "subtotal": '1.00',
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
                                  "price": '1.00',
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
                          UiHelperPaypal.showAlertDialog(
                              context, 'Grazie per il tuo sostegno.',
                              title: 'Success');
                        },
                        onError: (error) {
                          print("onError: $error");
                          Navigator.pop(context);
                          UiHelperPaypal.showAlertDialog(
                              context, 'Pagamento non avvenuto',
                              title: 'Error');
                        },
                        onCancel: () {
                          print('cancelled:');
                          UiHelperPaypal.showAlertDialog(
                              context, 'Pagamento cancellato',
                              title: 'Success');
                        },
                      ),
                    ));
                  }, */