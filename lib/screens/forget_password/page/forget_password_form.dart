import 'package:anf_app/screens/forget_password/bloc/forget_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/color_constants.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textfield.dart';
import '../../common_widgets/validator_email/validator_email.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
            final bloc = BlocProvider.of<ForgetPasswordBloc>(context);

    return BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
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
                          'Resetta la Password',
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
                        SizedBox(
                          height: 20,
                        ),
                        CommonStyleButton(
                          title: 'Resetta',
                          iconWidget: Icon(Icons.reset_tv),
                          onTap: () {
                            if(_formKey.currentState!.validate()) {
                            //loginUser(_emailController.text, _passwordController.text );
                            /*FocusScope.of(context).unfocus();
                                  bloc.add(SignUpTappedEvent()); */
                             bloc.add(ForgetPasswordFormEvent(
                                 
                                    email: _emailController.text,
                                   
                                  )); 
                            }
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
    );
  }
}
