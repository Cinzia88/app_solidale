import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:anf_app/const/color_constants.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textfield.dart';
import '../../common_widgets/validator_email/validator_email.dart';
import '../bloc/signup_bloc.dart';

class SignUpForm extends StatefulWidget {
   String service;
   SignUpForm({
    Key? key,
    required this.service,
  }) : super(key: key);
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isHidden = true;
  bool _isHiddenConfirm = true;



  void _onToggleVisibilityPassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _onToggleVisibilityPasswordConfirm() {
    setState(() {
      _isHiddenConfirm = !_isHiddenConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);

    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
     
      return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0
      ),
      child: Material(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                          fontSize: 25,
                          color: ColorConstants.titleText),
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
                      textEditingController: _passwordController,
                      labelTextCustom: 'Password:',
                      obscureText: _isHidden,
                      widgetIcon: InkWell(
                          onTap: _onToggleVisibilityPassword,
                          child: _isHidden
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: ColorConstants.orangeGradients3,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: ColorConstants.orangeGradients3,
                                )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Richiesto*';
                        }
                        return null;
                      },
                    ),
                    TextFormFieldCustom(
                        textEditingController: _confirmPasswordController,
                        labelTextCustom: 'Conferma Password:',
                        obscureText: _isHidden,
                        widgetIcon: InkWell(
                            onTap: _onToggleVisibilityPassword,
                            child: _isHidden
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: ColorConstants.orangeGradients3,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: ColorConstants.orangeGradients3,
                                  )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo Richiesto*';
                          } else if(value != _passwordController.text) {
                           return 'Le password non coincidono';
                        }
                          return null;
                        },
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    CommonStyleButton(
                      title: 'Crea',
                      iconWidget: Icon(Icons.person_add),
                      onTap: () {
                       if (_formKey.currentState!.validate()) {
                            bloc.add(SignUpTappedEvent(
                              nome: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                              richiesta: widget.service,
                            ));
                          }
                        },
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 30.0),
                child: Divider(
                  color: ColorConstants.titleText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: RichText(
                  text: TextSpan(
                    text: 'Possiedi già un account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: " Accedi",
                        style: TextStyle(
                          color: ColorConstants.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                           bloc.add(SignInTappedEvent());
                                                        // ;
      
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        );
    });
  }
}
