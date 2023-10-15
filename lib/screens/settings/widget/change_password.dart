import 'package:anf_app/const/color_constants.dart';

import 'package:flutter/material.dart';

import '../../common_widgets/custom_textfield.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  
 bool _obscureText = true;

  String? _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                      'Cambia Password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: ColorConstants.titleText),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                   
             IconButton(
                onPressed: _toggle,
                icon: _obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off)),
                    TextFormFieldCustom(
                      textEditingController: _emailController,
                      labelTextCustom: 'Password Corrente:',
                      obscure: _obscureText,
                       
                    ),
                    TextFormFieldCustom(
                      textEditingController: _passwordController,
                      labelTextCustom: 'Nuova Password:',
                    ),
                    TextFormFieldCustom(
                      textEditingController: _confirmPasswordController,
                      labelTextCustom: 'Conferma Password:',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text('Cambia'),
                      icon: const Icon(Icons.password),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          primary: ColorConstants.primaryColor,
                          onPrimary: Colors.white),
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
