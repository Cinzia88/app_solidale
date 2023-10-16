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
  final TextEditingController _passwordCurrentController = TextEditingController();
  final TextEditingController _passwordNewController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isHidden = true;
  bool _isHiddenConfirm = true;
    bool _isHiddenCurrent= true;


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
   void _onToggleVisibilityPasswordCurrent() {
    setState(() {
      _isHiddenCurrent = !_isHiddenCurrent;
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
                    TextFormFieldCustom(
                      textEditingController: _passwordCurrentController,
                      labelTextCustom: 'Password Corrente:',
                      obscureText: _isHiddenCurrent,
                      widgetIcon: InkWell(
                          onTap: _onToggleVisibilityPasswordCurrent,
                          child: _isHiddenCurrent
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: ColorConstants.orangeGradients3,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: ColorConstants.orangeGradients3,
                                )),
                    ),
                    TextFormFieldCustom(
                      textEditingController: _passwordNewController,
                      labelTextCustom: 'Nuova Password:',
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
                    ),
                    TextFormFieldCustom(
                      textEditingController: _confirmPasswordController,
                      labelTextCustom: 'Conferma Password:',
                      obscureText: _isHiddenConfirm,
                      widgetIcon: InkWell(
                          onTap: _onToggleVisibilityPasswordConfirm,
                          child: _isHiddenConfirm
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: ColorConstants.orangeGradients3,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: ColorConstants.orangeGradients3,
                                )),
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
