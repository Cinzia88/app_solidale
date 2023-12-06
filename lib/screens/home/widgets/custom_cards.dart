import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/servizi/offro%20aiuto/page/form_offro_aiuto.dart';
import 'package:app_solidale/screens/servizi/page/home_chiedo_aiuto.dart';
import 'package:app_solidale/screens/home/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/home/widgets/payment_form.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String titleOffroAiuto = "Offro Aiuto";
  String titleChiedoAiuto = "Chiedo Aiuto";

  CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('La tua email non è stata verificata',  style:
                TextStyle(color: Colors.black, fontSize: 2 * blockSizeVertical),),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeChiedoAiuto()));
            },
            child: CustomCardsCommon(
              child: CustomContainerService(
                title: titleChiedoAiuto,
                subtitle: 'Scopri i nostri principali servizi',
                image: PathConstants.onboarding3,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OffroAiutoPage()));
            },
            child: CustomCardsCommon(
              child: CustomContainerService(
                title: titleOffroAiuto,
                subtitle: 'Dona il tuo tempo a chi ne ha bisogno',
                image: PathConstants.offroAiuto,
              ),
            ),
          ),
           SizedBox(
              height: 5 * blockSizeVertical,
            ),
          Text(
            'Vuoi sostenere l\'ANF?',
            style:
                TextStyle(color: Colors.black, fontSize: 2 * blockSizeVertical),
          ),
          ElevatedButton(
            onPressed: () async {
              launchUrlString('https://www.anfam.net/come-sostenerci');
            },
         
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'DONA ORA',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 2 * blockSizeVertical),
              )
            ]),
          ),
        ],
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
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 75.0,
          automaticallyImplyLeading: true,
          flexibleSpace: customAppBar(context: context)),
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