
import 'package:app_solidale/const/paypal_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_solidale/const/color_constants.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textfield.dart';
import '../../common_widgets/validator_email/validator_email.dart';
import 'uihelperpaypal.dart';

// ignore: must_be_immutable
class PaymentForm extends StatefulWidget {
  
  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eurController = TextEditingController();

 



 
  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
        elevation: 10,
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Crea il Tuo Account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 3 * blockSizeVertical,
                          color: ColorConstants.titleText),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                 
                    TextFormFieldCustom(
                      textEditingController: _eurController,
                      labelTextCustom: 'Email:',
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Richiesto*';
                        } else if (!Validators.isValidEmail(value)) {
                          return 'Inserisci un\' email valida';
                        }
                        return null;
                      },
                    ),
                   
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(
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
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
