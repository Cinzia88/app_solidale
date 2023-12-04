



import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/text_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/carica_docs_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/bloc/send_parents_data_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/carica_parenti_page.dart';
import 'package:app_solidale/screens/servizi/page_service/bloc/send_phone_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormPhone extends StatefulWidget {
  final String title;
  final String image;
  const FormPhone({required this.title, required this.image});

  @override
  State<FormPhone> createState() => _FormPhoneState();
}

class _FormPhoneState extends State<FormPhone> {
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
                      SizedBox(
                        width: 70,
                        child: Image.asset(
                          widget.image,
                        ),
                      ),
                      SizedBox(
                        height: 3 * blockSizeVertical,
                      ),
                      Text(
                        '${widget.title}',
                        textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.titleSmall,

                      ),
                      
                   
                        widget.title != TextConstants.infoAlertTitleBancoAlim
                          ?  _altriServizi() : _servizioBancoAlimentare(),
                          SizedBox(
                            height: 30,
                          ),
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


  _altriServizi() {
    return Column(
      children: [
        Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Flexible(
                          child: Text(
                              'Richiedo il Servizio ${widget.title} per:')),
                    ],
                  ),
                ),
                ListTile(
                  title: forAnother == true
                      ? Text('Un Mio Familiare')
                      : Text(
                          'Me',
                        ),
                  trailing: Switch(
                      inactiveThumbColor: ColorConstants.orangeGradients3,
                      activeColor: ColorConstants.orangeGradients3,
                      value: forAnother,
                      onChanged: (value) {
                        setState(() {
                          forAnother = value;
                        });

                        //a secoonda del value che può essere falso o vero e va ad aggiornare il valore _isSecured
                        //tale value lo salvo nel provider
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                forAnother == true
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                  '(Inserisci i dati del familiare per il quale richiedi il servizio)'),
                            ),
                            TextFormFieldCustom(
                              textEditingController: _nameAnotherController,
                              labelTextCustom: 'Nome e Cognome:',
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo Richiesto*';
                                }
                                return null;
                              },
                            ),
                           
                            TextFormFieldCustom(
                              textEditingController: _telepAnotherController,
                              labelTextCustom: 'Telefono:',
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo Richiesto*';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      )
                    : _fieldTelephone(),
                 
             
              
      ],
    );
  }

   _servizioBancoAlimentare() {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: [
        
          CustomCardsCommon(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.family_restroom,
                                  color: ColorConstants.orangeGradients3,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text('Aggiungi Componenti Familiari',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 2.5 * blockSizeVertical,
                                          color: ColorConstants.orangeGradients3,
                                        )),
                                  ),
                                ),
                              ]
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Aggiungi i dati dei tuoi componenti familiari',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 ElevatedButton.icon(
                                   onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => ParentsPage()));
                                   },
                                   icon: const Icon(Icons.person_add),
                                   label: const Text('Aggiungi'),
                                 ),
                               ],
                             ),
                           
                  
                          ],
                        ),
                      ),
     SizedBox(
                              height: 50,
                            ),
                       CustomCardsCommon(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.file_copy,
                                  color: ColorConstants.orangeGradients3,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text('Carica I Tuoi Documenti',
                                                                style: Theme.of(context).textTheme.titleSmall,
),
                                  ),
                                ),
                              ]
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Carica i documenti per completare la richiesta',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 ElevatedButton.icon(
                                   onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => CaricaDocsPage()));
                                   },
                                   icon: const Icon(Icons.upload_file),
                                   label: const Text('Carica File'),
                                 ),
                               ],
                             ),
                           
                  
                          ],
                        ),
                      ),
                         SizedBox(
            height: 40,
          ),
                        _fieldTelephone(),
       
                  
        ],
      ),
    );
  }
}