import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/page/carica_docs_page.dart';
import 'package:flutter/material.dart';



class FormServizio extends StatefulWidget {
  final String title;
  const FormServizio({required this.title});

  @override
  State<FormServizio> createState() =>
      _FormServizioState();
}

class _FormServizioState extends State<FormServizio> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameAnotherController = TextEditingController();
  final TextEditingController _surnameAnotherController =
      TextEditingController();
  final TextEditingController _telepAnotherController = TextEditingController();

 
  bool forAnother = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           iconTheme: const IconThemeData(
            color: Colors.white,
           ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),actions: [
              IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, color: Colors.white,))
            ],
            ),
                       drawer: NavigationDrawerWidget(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
          
          
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        '${widget.title}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: ColorConstants.titleText),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorConstants.orangeGradients3,
                ),
               widget.title == 'Servizio: Banco Alimentare' ? CaricaDocsPage() : SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('La richiesta di prenotazione è:'),
                    ],
                  ),
                ),
                ListTile(
                        
                        title: forAnother == true ?   Text('Per familiare') : Text('Per me', ),
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                  '(Inserisci i dati del familiare per il quale richiedi il servizio)'),
                            ),
                            TextFormFieldCustom(
                              textEditingController: _nameAnotherController,
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
                              textEditingController:
                                  _surnameAnotherController,
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
                    : SizedBox(),
                CommonStyleButton(
                  title: 'Clicca per essere contattato',
                  iconWidget: Icon(Icons.contact_phone),
                  onTap: () {
                    if(_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                    /*FocusScope.of(context).unfocus();
                                              bloc.add(SignUpTappedEvent()); */
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}