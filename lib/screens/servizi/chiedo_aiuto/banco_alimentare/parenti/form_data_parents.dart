import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/bloc/send_parents_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormDataParents extends StatefulWidget {
  FormDataParents({Key? key}) : super(key: key);

  @override
  State<FormDataParents> createState() => _FormDataParentsState();
}

class _FormDataParentsState extends State<FormDataParents> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _countParentController = TextEditingController();
  var nomeComponente = <TextEditingController>[];
  var anniComponente = <TextEditingController>[];
  var gradoComponente = <TextEditingController>[];
  var cards = <Widget>[];
  bool yes = false;
  bool remove = false;
  String disabile = 'no';
  Widget createCard() {
    var nomeController = TextEditingController();
    var anniController = TextEditingController();
    var gradoController = TextEditingController();
    nomeComponente.add(nomeController);
    anniComponente.add(anniController);
    gradoComponente.add(gradoController);
    return Column(
      children: <Widget>[
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
          keyboardType: TextInputType.number,
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
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    final bloc = BlocProvider.of<SendParentsDataBloc>(context);
    return BlocBuilder<SendParentsDataBloc, SendParentsDataState>(
        builder: (context, state) {
      return state is SendParentsDataLoadingState
          ? loadingWidget(context)
          : Stack(
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
                                                     style: Theme.of(context).textTheme.titleSmall,

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
                                  textEditingController: _countParentController,
                                  labelTextCustom: 'N° Componenti Familiari:',
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo Richiesto*';
                                    }
                                    return null;
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: Text(
                                              'Nel nucleo familiare è presente una persona con invalidità?')),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: yes == true
                                      ? Text('Sì')
                                      : Text(
                                          'No',
                                        ),
                                  trailing: Switch(
                                      inactiveThumbColor:
                                          ColorConstants.orangeGradients3,
                                      activeColor:
                                          ColorConstants.orangeGradients3,
                                      value: yes,
                                      onChanged: (value) {
                                        setState(() {
                                          yes = value;
                                        });
                                        if (yes == true) {
                                          setState(() {
                                            disabile = 'sì';
                                          });
                                        } else {
                                          disabile = 'no';
                                        }

                                        //a secoonda del value che può essere falso o vero e va ad aggiornare il valore _isSecured
                                        //tale value lo salvo nel provider
                                      }),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: cards.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 40.0),
                                      child: Material(
                                        elevation: 10,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      'Componente ${index + 1}'),
                                                  index == 0
                                                      ? SizedBox()
                                                      : IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              cards.remove(
                                                                  cards[index]);
                                                            });
                                                          },
                                                          icon: Icon(
                                                              Icons.remove))
                                                ],
                                              ),
                                              cards[index],
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                CommonStyleButton(
                                  title: 'Invia',
                                  iconWidget: Icon(Icons.send),
                                  onTap: () {
                                    bloc.add(SendParentsNumberFormEvent(
                                        numeroComponenti:
                                            _countParentController.text,
                                        disabile: disabile));
                                    for (int i = 0; i < cards.length; i++) {
                                      var nome = nomeComponente[i].text;
                                      var anni = anniComponente[i].text;
                                      var grado = gradoComponente[i].text;
                                      bloc.add(SendParentsFormEvent(
                                          nomeParente: nome,
                                          anniParente: anni,
                                          gradoParente: grado));
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                              ],
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
                    child: CommonStyleButton(
                        title: 'Aggiungi',
                        onTap: () {
                          setState(() {
                            cards.add(createCard());
                          });
                        },
                        iconWidget: Icon(Icons.person_add)),
                  ),
                ),
              ],
            );
    });
  }
}
