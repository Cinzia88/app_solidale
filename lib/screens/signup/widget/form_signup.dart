import 'dart:convert';

import 'package:anf_app/const/color_constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textfield.dart';
import '../../signin/page/signin_page.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();


    Future registerUser( String email, String password, String passwordConfirmation) async {
    try {
var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/register';
  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(Uri.parse(url),
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json',
  },
  body: jsonEncode({
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
  }));

  if(response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignInPage()));
    print('response ${response.body}');
  } else {
    print('response ${response.body}');
  }
   
    } catch (e) {
      print('sendimage error $e');
    }
  }

  



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.5, right: 20, left: 20),
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
                    const Text(
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
                      textEditingController: _emailController,
                      labelTextCustom: 'Email:',
                      obscure: false,
                    ),
                    TextFormFieldCustom(
                      textEditingController: _passwordController,
                      labelTextCustom: 'Password:',
                      obscure: false,
                    ),
                    TextFormFieldCustom(
                      textEditingController: _confirmPasswordController,
                      labelTextCustom: 'Conferma Password:',
                      obscure: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CommonStyleButton(
                      title: 'Crea',
                      iconWidget: Icon(Icons.person_add),
                      onTap: () {
                        registerUser(_emailController.text, _passwordController.text, _confirmPasswordController.text);
                        /*FocusScope.of(context).unfocus();
                              bloc.add(SignUpTappedEvent()); */
                      },
                    ),
                 const   SizedBox(
                      height: 20,
                    ),
                   
                  ],
                ),
              ),
            const  Padding(
                padding:  EdgeInsets.only(bottom: 20.0, top: 10.0),
                child: Divider(
                  color: ColorConstants.titleText,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only( top: 10.0, bottom: 10),
                child: RichText(
                  text: TextSpan(
                    text: 'Possiedi già un account?',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: " Accedi",
                        style: const TextStyle(
                          color: ColorConstants.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const SignInPage()));
                            //  bloc.add(SignInTappedEvent());
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
  }
}
