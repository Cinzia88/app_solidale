import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/presentation/page/presentation_page.dart';

import 'package:app_solidale/screens/presentation/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/presentation/widgets/payment_form.dart';
import 'package:app_solidale/screens/presentation/widgets/uihelperpaypal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
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
              height: 15 * blockSizeVertical,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Vuoi sostenere l\'ANF?',
                  style: TextStyle(color: Colors.black, fontSize: 2 * blockSizeVertical),
                ),
                ElevatedButton(
                  onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentPage()));
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




class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PresentationPage())), arrow: true ),
          ),
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