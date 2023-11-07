


import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/reset_password/bloc/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/color_constants.dart';
import '../../common_widgets/custom_textfield.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordNewController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
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
        final bloc = BlocProvider.of<ResetPasswordBloc>(context);

    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 10,
                color: Colors.white,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              'La Tua Nuova Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: ColorConstants.titleText),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          
                            TextFormFieldCustom(
                              textEditingController: _newPasswordNewController,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo Richiesto*';
                                }
                                return null;
                              },
                            ),
                            TextFormFieldCustom(
                              textEditingController: _confirmNewPasswordController,
                              labelTextCustom: 'Conferma Password:',
                              obscureText: _isHidden,
                              widgetIcon: InkWell(
                                  onTap: _onToggleVisibilityPasswordConfirm,
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
                              title: 'Cambia',
                              iconWidget: Icon(Icons.change_circle),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                 bloc.add(ResetPasswordFormEvent(
                                 
                                    newPassword: _newPasswordNewController.text,
                                    confirmPassword:
                                        _confirmNewPasswordController.text,
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