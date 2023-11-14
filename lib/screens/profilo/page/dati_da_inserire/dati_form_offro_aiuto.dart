
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/offro_aiuto/bloc/profile_offro_aiuto_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../const/color_constants.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfield.dart';
import '../../../common_widgets/loading_widget.dart';
import '../../../common_widgets/validator_email/validator_email.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;

class FormDatiAnagraficiOffroAiuto extends StatefulWidget {
  @override
  State<FormDatiAnagraficiOffroAiuto> createState() => _FormDatiAnagraficiOffroAiutoState();
}

class _FormDatiAnagraficiOffroAiutoState extends State<FormDatiAnagraficiOffroAiuto> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
   final TextEditingController _typeController = TextEditingController();
  bool isCheck = false;

 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _nameController.text = globals.userData!.nome;
      _emailController.text = globals.userData!.email;
    });
  }

  @override
  Widget build(BuildContext context) {
        final bloc = BlocProvider.of<OffroAiutoDataBloc>(context);
 final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocBuilder<OffroAiutoDataBloc, OffroAiutoDataState>(
      builder: (context, state) {
        if(state is OffroAiutoDataLoadingState) {
              return loadingWidget(context);
            }
        return Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dati Anagrafici',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 3 * blockSizeVertical,
                              color: ColorConstants.titleText),
                        ),
                      ],
                    ),
                    const Divider(
                      color: ColorConstants.orangeGradients3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormFieldCustom(
                              textEditingController: _nameController,
                              labelTextCustom: 'Nome:',
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo Richiesto*';
                                }
                                return null;
                              },
                            ),
                            TextFormFieldCustom(
                              textEditingController: _surnameController,
                              labelTextCustom: 'Cognome:',
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo Richiesto*';
                                }
                                return null;
                              },
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
                              textEditingController: _telephoneController,
                              labelTextCustom: 'Telefono:',
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo Richiesto*';
                                }
                                return null;
                              },
                            ),
                           
                            TextFormFieldCustom(
                              textEditingController: _typeController,
                              labelTextCustom: 'Tipo Servizio:',
                              obscureText: false,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               
                                Flexible(
                                    child: Text(
                                  'Sei un\'associazione?',
                                )),
                                 Checkbox(
                                  value: isCheck,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isCheck = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text(
                              '(Se sì, spuntare la casella)',
                              style: TextStyle(
                                  color: ColorConstants.orangeGradients3),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            
                            SizedBox(
                              height: 20,
                            ),
                            CommonStyleButton(
                              title: 'Invia',
                              iconWidget: Icon(Icons.send),
                              onTap: () {
                                
                                if (_formKey.currentState!.validate()) {
                                   
                                bloc.add(OffroAiutoDataFormEvent
                                (
                                  nome: _nameController.text,
                                cognome: _surnameController.text,
                                telefono: _telephoneController.text,
                                email: _emailController.text,
                              tipoAiuto: _typeController.text,
                                associazione: isCheck == true ? 'sì' : 'no',
                                ));
                                  /*FocusScope.of(context).unfocus();
                                                bloc.add(SignUpTappedEvent()); */
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
