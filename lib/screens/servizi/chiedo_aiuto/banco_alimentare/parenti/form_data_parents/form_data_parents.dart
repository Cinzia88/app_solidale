import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/bloc/send_parents_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
  List<Widget>? growableList;
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
  String selectedValue = '1';

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
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    final bloc = BlocProvider.of<SendParentsDataBloc>(context);

     growableList =
    List<Widget>.generate(int.parse(selectedValue), (int index) {
      cards.add(createCard());
      return Column(
      children: [
        Padding(
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
                                              Text(
                                                  'Componente ${index + 1}'),
                                                   cards[index]

                                            ],
                                          ),
                                        ),
                                      ),
                                    )
      ],
    );
    }  );
print(growableList); 
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
                              'Fase 1 di 3',
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
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    hint: Text(
                                      'N° Componenti',
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
                                                overflow: TextOverflow.ellipsis,
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
                                        borderRadius: BorderRadius.circular(14),
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
                                      width: MediaQuery.of(context).size.width -
                                          150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
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
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                               
                                
                                SizedBox(
                                  height: 30,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: growableList!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return  growableList![index]; 
                                  },
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
                        title: 'Avanti',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            bloc.add(SendParentsNumberFormEvent(
                                numeroComponenti: selectedValue,
                                ));
                            for (int i = 0; i < growableList!.length; i++) {
                              var nome = nomeComponente[i].text;
                              var anni = anniComponente[i].text;
                              var grado = gradoComponente[i].text;
                              bloc.add(SendParentsFormEvent(
                                  nomeParente: nome,
                                  anniParente: anni,
                                  gradoParente: grado));
                            }
                          }
                        },
                        iconWidget: SizedBox()),
                  ),
                ),
              ],
            );
    });
  }
}





