


import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textfield.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
    final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    Text('Recupera Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: ColorConstants.titleText),),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFieldCustom(
                      textEditingController: _emailController,
                      labelTextCustom: 'Email:',
                      obscureText: false,
                    ),
                
                   SizedBox(
                      height: 20,
                    ),
                    CommonStyleButton(
                      title: 'Recupera',
                      iconWidget: Icon(Icons.reset_tv),
                      onTap: () {
                        //loginUser(_emailController.text, _passwordController.text );
                        /*FocusScope.of(context).unfocus();
                              bloc.add(SignUpTappedEvent()); */
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