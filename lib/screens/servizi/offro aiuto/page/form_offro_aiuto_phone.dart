

import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/page_service/bloc/send_phone_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormOffroAiutoPhone extends StatefulWidget {

  @override
  State<FormOffroAiutoPhone> createState() => _FormOffroAiutoPhoneState();
}

class _FormOffroAiutoPhoneState extends State<FormOffroAiutoPhone> {
   final _formKey = GlobalKey<FormState>();
  final TextEditingController _telephoneUserController = TextEditingController();

  final TextEditingController _nameAnotherController = TextEditingController();
  final TextEditingController _telepAnotherController = TextEditingController();

  bool forAnother = false;
  @override
  Widget build(BuildContext context) {
     //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
  final bloc = BlocProvider.of<SendPhoneBloc>(context);
    return BlocBuilder<SendPhoneBloc, SendPhoneState>(builder: (context, state) {
     
      return  state is SendPhonLoadingState ? loadingWidget(context ) : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                     
                            CommonStyleButton(
                  title: 'Clicca per essere contattato',
                  iconWidget: Icon(Icons.contact_phone),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(SendPhoneFormEvent(telefono: _telephoneUserController.text));
                    }
                    /*FocusScope.of(context).unfocus();
                                              bloc.add(SignUpTappedEvent()); */
                  },
                ),
                    ],
                  ),
                ),
              ),
  );
  });
  }

    _fieldTelephone() {
    return TextFormFieldCustom(
                        textEditingController: _telephoneUserController,
                        labelTextCustom: 'Telefono:',
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo Richiesto*';
                          }
                          return null;
                        },
                      );
  }


  
}