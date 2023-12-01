import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/text_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/carica_docs_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/carica_parenti_page.dart';
import 'package:flutter/material.dart';

class FormServizio extends StatefulWidget {
  final String title;
  final String image;
  const FormServizio({required this.title, required this.image});

  @override
  State<FormServizio> createState() => _FormServizioState();
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
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 75.0,
        automaticallyImplyLeading: true,
        flexibleSpace: customAppBar(context: context),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))
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
                  children: [
                    SizedBox(
                      width: 70,
                      child: Image.asset(
                        widget.image,
                      ),
                    ),
                    SizedBox(
                      width: 3 * blockSizeVertical,
                    ),
                    Flexible(
                      child: Text(
                        '${widget.title}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 3 * blockSizeVertical,
                            color: ColorConstants.titleText),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Text(
                              'Richiesta del \nServizio Taxi Solidale in qualità di:')),
                    ],
                  ),
                ),
                ListTile(
                  title: forAnother == true
                      ? Text('Familiare')
                      : Text(
                          'Beneficiario',
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
                              textEditingController: _surnameAnotherController,
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
                    : TextFormFieldCustom(
                        textEditingController: _nameAnotherController,
                        labelTextCustom: 'Telefono:',
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo Richiesto*';
                          }
                          return null;
                        },
                      ),
                       SizedBox(
                  height: 30,
                ),
                widget.title == TextConstants.infoAlertTitleBancoAlim
                    ? _selectButton()
                    : SizedBox(),
               
              /*  CommonStyleButton(
                  title: 'Clicca per essere contattato',
                  iconWidget: Icon(Icons.contact_phone),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                    /*FocusScope.of(context).unfocus();
                                              bloc.add(SignUpTappedEvent()); */
                  },
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectButton() {
    return Column(children: [
      Text('Per completare la richiesta, devi aggiungere i dati dei tuoi componenti familiari'),
       SizedBox(
                  height: 30,
                ),
      CommonStyleButton(
          title: 'Componenti familiari',
          iconWidget: Icon(Icons.family_restroom),
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => ParentsPage()));
          }),
              /*CommonStyleButton(
          title: 'Carica file',
          iconWidget: Icon(Icons.upload),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => CaricaDocsPage()))), */
    ]);
  }
}
