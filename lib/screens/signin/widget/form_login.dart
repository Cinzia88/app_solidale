import 'dart:convert';

import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/screens/home/page/offro%20aiuto/offro_aiuto_page.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textfield.dart';
import '../../home/tabs/page_tabs.dart';
import '../../reset_password/page/reset_password_page.dart';

class LoginForm extends StatefulWidget {
 

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
bool _isHidden = true;

Future loginUser( String email, String password, ) async {
    try {
var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/login';
  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(Uri.parse(url),
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json',
  },
  body: jsonEncode({
    'email': email,
    'password': password,
  }));

  if(response.statusCode == 200) {
  
       Navigator.push(context, MaterialPageRoute(builder: (_) => const TabsPage()));
        print('response ${response.body}');
    
   

  } else {
    print('erroresponse ${response.body}');
  }
   
    } catch (e) {
      print('sendimage error $e');
    }
  }

   void _onToggleVisibilityPassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5, right: 20, left: 20, ),
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
                    Text('Accedi al Tuo Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: ColorConstants.titleText),),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFieldCustom(
                      textEditingController: _emailController,
                      labelTextCustom: 'Email:',
                      obscureText: false,
                    ),
                    TextFormFieldCustom(
                      textEditingController: _passwordController,
                      labelTextCustom: 'Password:',
                       obscureText: _isHidden,
                      widgetIcon: InkWell(
                        onTap: _onToggleVisibilityPassword,
                        child: _isHidden ? const Icon(Icons.visibility_off, color: ColorConstants.orangeGradients3,) : const Icon(Icons.visibility, color: ColorConstants.orangeGradients3,)),
                    ),
                   SizedBox(
                      height: 20,
                    ),
                    CommonStyleButton(
                      title: 'Accedi',
                      iconWidget: Icon(Icons.login),
                      onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (_) => const TabsPage()));
                        //loginUser(_emailController.text, _passwordController.text );
                        /*FocusScope.of(context).unfocus();
                              bloc.add(SignUpTappedEvent()); */
                      },
                    ),
                    SizedBox(
                      height: 30,
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ResetPasswordPage()));
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
                padding: const EdgeInsets.only(bottom:20.0, top: 30.0),
                child: Divider(
                  color: ColorConstants.titleText,
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.only( top: 10.0, bottom: 10),
                child: RichText(
                        text: TextSpan(
                          text: 'Non possiedi un account?',
                        style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                          children: [
                TextSpan(
                  text: " Crea",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
