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
import 'package:device_preview/device_preview.dart';
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
  var nomeEditController = TextEditingController();
  var nomeController = TextEditingController();
  var birthController = TextEditingController();
  var gradoController = TextEditingController();
   var nomeEmptyController = TextEditingController();
  var birthEmptyController = TextEditingController();
  var gradoEmptyController = TextEditingController();
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

  List<ParentsData>? listData;

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    Widget createCard(ParentsData data) {
      nomeController = TextEditingController(text: data.nome);
      birthController = TextEditingController(text: data.dataDiNascita);
      gradoController = TextEditingController(text: data.grado);

      nomeComponente.add(nomeController);
      dateinput.add(birthController);
      gradoComponente.add(gradoController);

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
            textEditingController:
                birthController, //editing controller of this TextField
            labelTextCustom: 'Data di Nascita:',
            readOnly: true,
            obscureText: false,
            //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context, initialDate: DateTime.now(),
                firstDate: DateTime(
                    1900), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: ColorConstants.secondaryColor,
                        onPrimary: Colors.white,
                        surface: Colors.white,
                        onSurface: ColorConstants.orangeGradients3,
                      ),
                      dialogBackgroundColor: Colors.white,
                    ),
                    child: child!,
                  );
                },
              );

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  birthController.text = formattedDate;
                  data.dataDiNascita = birthController.text;

                });
                                print("Date is  selected ${data.dataDiNascita}");

              } else {
                print("Date is not selected ${birthController.text}");
              }
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

 Widget createCardEmpty() {
     

      nomeComponente.add(nomeEmptyController);
      dateinput.add(birthEmptyController);
      gradoComponente.add(gradoEmptyController);

      return Column(
        children: <Widget>[
          TextFormFieldCustom(
            textEditingController: nomeEmptyController,
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
            textEditingController:
                birthEmptyController, //editing controller of this TextField
            labelTextCustom: 'Data di Nascita:',
            readOnly: true,
            obscureText: false,
            //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context, initialDate: DateTime.now(),
                firstDate: DateTime(
                    1900), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: ColorConstants.secondaryColor,
                        onPrimary: Colors.white,
                        surface: Colors.white,
                        onSurface: ColorConstants.orangeGradients3,
                      ),
                      dialogBackgroundColor: Colors.white,
                    ),
                    child: child!,
                  );
                },
              );

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  birthEmptyController.text = formattedDate;

                });

              } else {
                print("Date is not selected ${birthController.text}");
              }
            },
          ),
          TextFormFieldCustom(
            textEditingController: gradoEmptyController,
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

    growableList = List<Widget>.generate(int.parse(selectedValue), (int index) {
      print('index $index');
      if (listData == null) {
        return SizedBox();
      } else if (int.parse(selectedValue) != listData!.length){
        cards.add(createCardEmpty());
      }else if (int.parse(selectedValue) == listData!.length) { 
        for (int i = 0; i < listData!.length; i++) {
          cards.add(createCard(listData![i]));
        }
      } 
print('selectedValue $selectedValue');
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Material(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Componente ${index + 1}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    cards[index]
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
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
                                    itemCount: growableList!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                         
                                      return Column(
                                        children: [
                                          growableList![index],
                                        ],
                                      );
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CommonStyleButton(
                                          title: 'Aggiorna',
                                          onTap: () {
                                            for (int i = 0;
                                                i < growableList!.length;
                                                i++) {
                                              var id = parentsEditId[i];
                                              var nome = nomeComponente[i].text;
                                              var anni = dateinput[i].text;
                                              var grado =
                                                  gradoComponente[i].text;
                                              print('parent $id');
                                              EditDataParentsRepository()
                                                  .editDataParents(context, id,
                                                      nome, anni, grado);
                                              print('nomeC ${nome}');
                                                                                            print('anniC ${anni}');
                                              print('gradoC ${grado}');

                                            }
                                                                                           Navigator.pop(context);

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
}



/*     List<ParentsData> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var nome = nomeComponente[i].text;
      var anni = anniComponente[i].text;
      var grado = gradoComponente[i].text;
      service.sendDataParents(context, nome, anni, grado);
    } */