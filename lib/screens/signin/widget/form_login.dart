import 'package:anf_app/const/color_constants.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5, right: 20, left: 20),
      child: Material(
        elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color(0xFFEF6E31)),),
                    TextFormFieldCustom(
                      textEditingController: _emailController,
                      labelTextCustom: 'Email:',
                      obscure: false,
                    ),
                    TextFormFieldCustom(
                      textEditingController: _passwordController,
                      labelTextCustom: 'Password:',
                      obscure: false,
                    ),
                   
                    CommonStyleButton(
                      title: 'Accedi',
                      onTap: () {
                        /*FocusScope.of(context).unfocus();
                              bloc.add(SignUpTappedEvent()); */
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         RichText(
              text: TextSpan(
              text: '',
              
              children: [
                TextSpan(
                  text: "Recupera Password",
                  style: TextStyle(
                    color: ColorConstants.primaryColor,
                    fontSize: 16,
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
                       ],
                     ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:20.0, top: 20.0),
                child: Divider(
                  color: Color(0xFFEF6E31),
                ),
              ),
             
              RichText(
          text: TextSpan(
            text: 'Non hai un account?',
          style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
            children: [
              TextSpan(
                text: " Crea il Tuo Account",
                style: TextStyle(
                  color: ColorConstants.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
              Navigator.pop(context);
                  //  bloc.add(SignInTappedEvent());
                  },
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
