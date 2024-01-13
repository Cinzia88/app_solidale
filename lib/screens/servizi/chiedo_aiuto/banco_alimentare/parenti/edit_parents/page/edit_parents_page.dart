import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/bloc/send_parents_data_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/bloc_edit_parents/bloc/read_parents_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/model/edit_parents_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/repo/edit_parents_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/form_data_parents/form_data_parents.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/repository/send_parents_data_repository.dart';

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';

import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ParentsPageEdit extends StatefulWidget {
  const ParentsPageEdit({super.key});

  @override
  State<ParentsPageEdit> createState() => _ParentsPageEditState();
}

class _ParentsPageEditState extends State<ParentsPageEdit> {
  List<String> nomeParent = [];
  final _formKey = GlobalKey<FormState>();
  var nomeComponente = <TextEditingController>[];
  var dateinput = <TextEditingController>[];
  var gradoComponente = <TextEditingController>[];
  var nomeController = TextEditingController();
  var birthController = TextEditingController();
  var gradoController = TextEditingController();
  var nomeComponenteNew = <TextEditingController>[];
  var dateinputNew = <TextEditingController>[];
  var gradoComponenteNew = <TextEditingController>[];
  String nomeNew = '';
String dateNew = '';

String gradoNew = '';
  String selectedValue = '1';
  List<Widget>? growableList;
  List<Widget>? card;
  List<String> parentsEditId = [];

  final List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
  ];

  //text editing controller for text field

  var cards = <Widget>[];
  bool yes = false;
  bool remove = false;
  String disabile = 'no';
  int box = 1;

  List<ParentsData>? listData;

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;

    return BlocProvider<ReadParentsBloc>(
      create: (context) => ReadParentsBloc(
        context: context,
        editDataParentsRepository: context.read<EditDataParentsRepository>(),
      )..add(FetchParentsEvent()),
      child: Scaffold(
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
        body: BlocConsumer<ReadParentsBloc, ReadParentsState>(
          listener: (context, state) {
            if (state is ReadParentsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            } else if (state is ReadParentsLoadedState) {
              setState(() {
                selectedValue = state.data.length.toString();
                listData = state.data;
              });

              for (int i = 0; i < state.data.length; i++) {
                setState(() {
                  parentsEditId.add(state.data[i].id);
                  nomeComponente
                      .add(TextEditingController(text: state.data[i].nome));
                  dateinput.add(
                      TextEditingController(text: state.data[i].dataDiNascita));
                  gradoComponente
                      .add(TextEditingController(text: state.data[i].grado));
                });
              }
            }
          },
          builder: (context, state) {
            return state is ReadParentsLoadingState ||
                    state is EditParentsLoadingState
                ? loadingWidget(context)
                : SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        child: Column(children: [
                          SizedBox(
                            width: 70,
                            child: Image.asset(
                              PathConstants.bancoAlim,
                            ),
                          ),
                          SizedBox(
                            height: 3 * blockSizeVertical,
                          ),
                          Text(
                            'Banco Alimentare',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Modifica Dati Componenti Familiari',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          const Divider(
                            color: ColorConstants.orangeGradients3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Modifica il numero dei componenti '),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      hint: Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: ColorConstants.labelText,
                                        ),
                                      ),
                                      items: items
                                          .map((String item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedValue = value!;
                                        });
                                      },
                                      buttonStyleData: ButtonStyleData(
                                        height: 50,
                                        width: 160,
                                        padding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          border: Border.all(
                                            color:
                                                ColorConstants.orangeGradients1,
                                          ),
                                          color: Colors.white,
                                        ),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                        iconSize: 20,
                                        iconEnabledColor:
                                            ColorConstants.orangeGradients3,
                                        iconDisabledColor: Colors.grey,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        maxHeight: 200,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: Colors.white,
                                        ),
                                        scrollbarTheme: ScrollbarThemeData(
                                          radius: const Radius.circular(40),
                                          thickness:
                                              MaterialStateProperty.all<double>(
                                                  6),
                                          thumbVisibility:
                                              MaterialStateProperty.all<bool>(
                                                  true),
                                        ),
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        height: 40,
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Modifica i dati di ciascun componente'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: listData!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      nomeController = nomeComponente[index];
                                      birthController = dateinput[index];
                                      gradoController = gradoComponente[index];

                                      nomeComponente.add(nomeController);
                                      dateinput.add(nomeController);
                                      gradoComponente.add(nomeController);
                                      box = index + 1;
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 40.0),
                                            child: Material(
                                              elevation: 10,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Componente ${index + 1}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium,
                                                        ),
                                                        
                                                        IconButton(
                                                            onPressed: () {
                                                            
                                                                   
                                                              EditDataParentsRepository()
                                                                  .deleteParentData(
                                                                context,
                                                                listData![index]
                                                                    .id,
                                                              ).then((value){
                                                              FetchParentsEvent();} 
                                                                  );
                                                            },
                                                            icon: Icon(
                                                                Icons.delete,
                                                                color:
                                                                    Colors.red))
                                                      ],
                                                    ),
                                                    createCard(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  int.parse(selectedValue) > listData!.length
                                      ? SizedBox(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  int.parse(selectedValue) -
                                                      listData!.length,
                                              itemBuilder: (context, index) {
                                                box = int.parse(selectedValue) -
                                                    listData!.length;
                                                nomeController =
                                                    TextEditingController();
                                                birthController =
                                                    TextEditingController();
                                                gradoController =
                                                    TextEditingController();

                                                nomeComponenteNew
                                                    .add(nomeController);
                                                dateinputNew
                                                    .add(birthController);
                                                gradoComponenteNew
                                                    .add(gradoController);
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 40.0),
                                                      child: Material(
                                                        elevation: 10,
                                                        color: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Componente ${listData!.length + index + 1}',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              createCard(),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              }),
                                        )
                                      : Text(''),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CommonStyleButton(
                                          title: 'Aggiorna',
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              for (int i = 0;
                                                  i < listData!.length;
                                                  i++) {
                                                var id = listData![i].id;
                                                var nome =
                                                    nomeComponente[i].text;
                                                var anni = dateinput[i].text;
                                                var grado =
                                                    gradoComponente[i].text;

                                                EditDataParentsRepository()
                                                    .editDataParents(context,
                                                        id, nome, anni, grado);
                                                Navigator.pop(context);
                                              }

                                              for (int i = 0;
                                                  i < nomeComponenteNew.length;
                                                  i++) {
                                              setState(() {
                                                  nomeNew =
                                                    nomeComponenteNew[i].text;
                                              });
                                              }
                                              for (int i = 0;
                                                  i < dateinputNew.length;
                                                  i++) {
                                                setState(() {
                                                  dateNew = dateinputNew[i].text;
                                                });
                                              }
                                              for (int i = 0;
                                                  i < gradoComponenteNew.length;
                                                  i++) {
                                                setState(() {
                                                  gradoNew =
                                                    gradoComponenteNew[i].text;
                                                });
                                              }
                                               EditDataParentsRepository()
                                                    .sendDataNewParents(context,
                                                         nomeNew, dateNew, gradoNew);
                                            }
                                          },
                                          iconWidget: Text('')),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ])),
                  );
          },
        ),
      ),
    );
  }

  Widget createCard() {
    return Column(
      children: <Widget>[
        TextFormFieldCustom(
          textEditingController: nomeController,
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
          textEditingController: birthController,
          labelTextCustom: 'Data di Nascita',
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
          labelTextCustom: 'Grado di Parentela:',
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
}



/*     List<ParentsData> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var nome = nomeComponente[i].text;
      var anni = anniComponente[i].text;
      var grado = gradoComponente[i].text;
      service.sendDataParents(context, nome, anni, grado);
    } */