import 'package:app_solidale/const/color_constants.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../common_widgets/custom_textfield.dart';
import '../../../../common_widgets/validator_email/validator_email.dart';

class FormOffroAiuto extends StatefulWidget {
  const FormOffroAiuto({super.key});

  @override
  State<FormOffroAiuto> createState() => _FormOffroAiutoState();
}

class _FormOffroAiutoState extends State<FormOffroAiuto> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Offro Aiuto',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 3 * blockSizeVertical,
                      color: ColorConstants.titleText),
                ),
              ],
            ),
            const Divider(
              color: ColorConstants.orangeGradients3,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormFieldCustom(
              textEditingController: _nameController,
              labelTextCustom: 'Nome:',
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo Richiesto*';
                }
                return null;
              },
            ),
            TextFormFieldCustom(
              textEditingController: _surnameController,
              labelTextCustom: 'Cognome:',
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo Richiesto*';
                }
                return null;
              },
            ),
            TextFormFieldCustom(
              textEditingController: _telephoneController,
              labelTextCustom: 'Telefono:',
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo Richiesto*';
                }
                return null;
              },
            ),
            TextFormFieldCustom(
              textEditingController: _emailController,
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
            const Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Scegli il tipo di aiuto:',
                    ),
                  ],
                ),
              ),
            Row(
                children: [
                  Checkbox(
                      value: false,
                      onChanged: (taxyValue) {
                        setState(() {
                        var  value = taxyValue!;
                        });
                      }),
                  Text('Taxi Solidale'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: false,
                      onChanged: (carValue) {
                        setState(() {
                           var  value  = carValue!;
                        });
                      }),
                  Text('Accompagnamento Oncologico'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: false,
                      onChanged: (carValue) {
                        setState(() {
                           var  value  = carValue!;
                        });
                      }),
                  Text('ANF & Banco Alimentare'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: false,
                      onChanged: (carValue) {
                        setState(() {
                           var  value  = carValue!;
                        });
                      }),
                  Text('Banco del farmaco'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: false,
                      onChanged: (carValue) {
                        setState(() {
                           var  value  = carValue!;
                        });
                      }),
                  Text('Itinerari Didattici - Educativi'),
                ],
              ),
              TextFormFieldCustom(
              textEditingController: _serviceController,
              labelTextCustom: 'Altro:',
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
            CommonStyleButton(
              title: 'Invia',
              iconWidget: Icon(Icons.send),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  /*FocusScope.of(context).unfocus();
                                          bloc.add(SignUpTappedEvent()); */
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
