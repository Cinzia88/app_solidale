import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/profilo/page/cambio_password/bloc/change_password_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../common_widgets/custom_textfield.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordCurrentController =
      TextEditingController();
  final TextEditingController _passwordNewController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isHiddenCurrent = true;
  bool _isHiddenNew = true;
  bool _isHiddenConfirm = true;

  void _onToggleVisibilityPasswordCurrent() {
    setState(() {
      _isHiddenCurrent = !_isHiddenCurrent;
    });
  }

  void _onToggleVisibilityPasswordNew() {
    setState(() {
      _isHiddenNew = !_isHiddenNew;
    });
  }

  void _onToggleVisibilityPasswordConfirm() {
    setState(() {
      _isHiddenConfirm = !_isHiddenConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ChangePasswordBloc>(context);
 final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
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
                          'Cambio Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 3 * blockSizeVertical,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Richiesto*';
                            }
                            return null;
                          },
                        ),
                        TextFormFieldCustom(
                          textEditingController: _passwordNewController,
                          labelTextCustom: 'Nuova Password:',
                          obscureText: _isHiddenNew,
                          widgetIcon: InkWell(
                              onTap: _onToggleVisibilityPasswordNew,
                              child: _isHiddenNew
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
                            } else if (value.length < 8) {
                            return 'La password deve essere maggiore di 8 caratteri';
                          }
                            return null;
                          },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Richiesto*';
                            } else if (value != _passwordNewController.text) {
                            return 'Le password non coincidono';
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
                              bloc.add(ChangePasswordFormEvent(
                                currentPassword:
                                    _passwordCurrentController.text,
                                newPassword: _passwordNewController.text,
                                confirmPassword:
                                    _confirmPasswordController.text,
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
      },
    );
  }
}
