import 'package:anf_app/const/color_constants.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfield.dart';
import '../../../common_widgets/validator_email/validator_email.dart';

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
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.5,
          right: 20,
          left: 20,
          bottom: 20),
      child: Material(
          elevation: 10,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Offro Aiuto',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
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
                  TextFormFieldCustom(
                    textEditingController: _serviceController,
                    labelTextCustom: 'Tipo di aiuto:',
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Richiesto*';
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
          )),
    );
  }
}
