import 'dart:io';
import 'package:flutter/services.dart';

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
  final TextEditingController _countParentController = TextEditingController();
  var nomeComponente = <TextEditingController>[];
  var anniComponente = <TextEditingController>[];
  var gradoComponente = <TextEditingController>[];
  var cards = <Widget>[];
  bool remove = false;
  Widget createCard() {
    var nomeController = TextEditingController();
    var anniController = TextEditingController();
    var gradoController = TextEditingController();
    nomeComponente.add(nomeController);
    anniComponente.add(anniController);
    gradoComponente.add(gradoController);
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                remove == false
                    ? Text('Componente ${cards.length + 1}')
                    : Text('Componente ${cards.length--}'),
                IconButton(onPressed: () {}, icon: Icon(Icons.remove))
              ],
            ),
            TextFormFieldCustom(
              textEditingController: nomeController,
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
              textEditingController: anniController,
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
              textEditingController: gradoController,
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
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<ParentsData> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var nome = nomeComponente[i].text;
      var anni = anniComponente[i].text;
      var grado = gradoComponente[i].text;
      service.sendDataParents(context, nome, anni, grado);
    }
    print('entries $entries');

    Navigator.pop(context, entries);
  }

  Service service = Service();

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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(
                    20.0,
                  ),
                  child: Column(children: [
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
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cards.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                cards[index],
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cards.removeAt(index);
                                        remove = true;
                                      });
                                    },
                                    icon: Icon(Icons.remove))
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ])),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonStyleButton(
                        title: 'Aggiungi',
                        onTap: () {
                          setState(() {
                            cards.add(createCard());
                            remove = false;
                          });
                        },
                        iconWidget: Icon(Icons.person_add)),
                    CommonStyleButton(
                      title: 'Fatto',
                      iconWidget: Icon(Icons.done),
                      onTap: () {
                        _onDone();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class ParentsData {
  final String nome;
  final String anni;
  final String grado;

  ParentsData(this.nome, this.anni, this.grado);
  @override
  String toString() {
    return 'nome: $nome, anni: $anni, grado: $grado';
  }
}
