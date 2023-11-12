
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../const/color_constants.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfield.dart';
import '../../../common_widgets/loading_widget.dart';
import '../../../common_widgets/validator_email/validator_email.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;

class FormDatiAnagrafici extends StatefulWidget {
  @override
  State<FormDatiAnagrafici> createState() => _FormDatiAnagraficiState();
}

class _FormDatiAnagraficiState extends State<FormDatiAnagrafici> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numeroComponentiController =
      TextEditingController();
  final TextEditingController _etaComponentiController =
      TextEditingController();
  bool isCheck = false;
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _nameController.text = globals.userData!.nome!;
      _emailController.text = globals.userData!.email!;
    });
  }

  @override
  Widget build(BuildContext context) {
        final bloc = BlocProvider.of<ProfileDataBloc>(context);
 final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocBuilder<ProfileDataBloc, ProfileDataState>(
      builder: (context, state) {
        if(state is ProfileDataLoadingState) {
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
                              textEditingController: _addressController,
                              labelTextCustom: 'Indirizzo:',
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo Richiesto*';
                                }
                                return null;
                              },
                            ),
                            TextFormFieldCustom(
                              textEditingController:
                                  _numeroComponentiController,
                              labelTextCustom: 'N° Componenti Familiari:',
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo Richiesto*';
                                }
                                return null;
                              },
                            ),
                            TextFormFieldCustom(
                              textEditingController: _etaComponentiController,
                              labelTextCustom: 'Età Componenti Familiari:',
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
                                Checkbox(
                                  value: isCheck,
                                  onChanged: (newValue) {
                                    setState(() {
                                      isCheck = newValue!;
                                    });
                                  },
                                ),
                                Flexible(
                                    child: Text(
                                  'Nel nucleo familiare è presente una persona con disabilità',
                                ))
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
                                   
                                bloc.add(ProfileDataFormEvent
                                (richiesta: globals.typeRichiesta!,
                                  nome: _nameController.text,
                                cognome: _surnameController.text,
                                telefono: _telephoneController.text,
                                email: _emailController.text,
                                indirizzo: _addressController.text,
                                numeroComponenti: _numeroComponentiController.text,
                                etaComponenti: _etaComponentiController.text,
                                presenzaDisabilita: isCheck == true ? 'sì' : 'no',
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
