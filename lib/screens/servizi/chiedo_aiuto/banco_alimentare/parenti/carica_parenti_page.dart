import 'dart:io';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/menu/area_personale/profilo_page.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/service/service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ParentsPage extends StatefulWidget {
  const ParentsPage({super.key});

  @override
  State<ParentsPage> createState() => _ParentsPageState();
}

class _ParentsPageState extends State<ParentsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeParentController = TextEditingController();
   final TextEditingController _anniParentController = TextEditingController();
  final TextEditingController _gradoParentController = TextEditingController();
  int componente = 1;
  bool addComponent = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
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
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Componenti Familiari',
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
                          Text('Componente n. $componente'),
                          TextFormFieldCustom(
                            textEditingController: _nomeParentController,
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
                            textEditingController: _anniParentController,
                            labelTextCustom: 'Età:',
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo Richiesto*';
                              }
                              return null;
                            },
                          ),
                           TextFormFieldCustom(
                            textEditingController: _gradoParentController,
                            labelTextCustom: 'Grado di parentela:',
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo Richiesto*';
                              }
                              return null;
                            },
                          ),
                          CommonStyleButton(title: 'Aggiungi Componente', onTap: (){
                            setState(() {
                              addComponent = true;
                              componente++;
                            });
                          }, iconWidget: Icon(Icons.person_add_alt)),
                         addComponent == true ? Column(
                          children: [
                            Text('Componente n. $componente'),
                          TextFormFieldCustom(
                            textEditingController: _nomeParentController,
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
                            textEditingController: _anniParentController,
                            labelTextCustom: 'Età:',
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo Richiesto*';
                              }
                              return null;
                            },
                          ),
                           TextFormFieldCustom(
                            textEditingController: _gradoParentController,
                            labelTextCustom: 'Grado di parentela:',
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo Richiesto*';
                              }
                              return null;
                            },
                          ),
                          ],
                         ) : SizedBox(),
                          SizedBox(
                            height: 20,
                          ),
                          CommonStyleButton(
                            title: 'Invia',
                            iconWidget: Icon(Icons.send),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
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
        )));
  }
}
