
import 'package:anf_app/const/color_constants.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textfield.dart';
import '../../common_widgets/validator_email/validator_email.dart';
import '../../reset_password/page/reset_password_page.dart';
import '../bloc/signin_bloc.dart';

class LoginForm extends StatefulWidget {
   
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isHidden = true;



  void _onToggleVisibilityPassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
        final bloc = BlocProvider.of<SignInBloc>(context);

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
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
                          'Accedi al Tuo Account',
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
                        SizedBox(
                          height: 20,
                        ),
                        CommonStyleButton(
                          title: 'Accedi',
                          iconWidget: Icon(Icons.login),
                          onTap: () {
                            if(_formKey.currentState!.validate()) {
                            bloc.add(SignInFormEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ));
                              } 

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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    ResetPasswordPage()));
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
                    padding: const EdgeInsets.only(bottom: 20.0, top: 30.0),
                    child: Divider(
                      color: ColorConstants.titleText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
    );
  }
}




class ChiedoAiutoPage extends StatelessWidget {
  const ChiedoAiutoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Chiedo Aiuto')
          ],
        ),
      ),
    );
  }
}