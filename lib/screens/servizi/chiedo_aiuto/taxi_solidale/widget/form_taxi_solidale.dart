import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/bloc/send_parents_data_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/bloc/send_disabili_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FormTaxiSolidale extends StatefulWidget {
  const FormTaxiSolidale({super.key});


  @override
  State<FormTaxiSolidale> createState() => _FormTaxiSolidaleState();
}

class _FormTaxiSolidaleState extends State<FormTaxiSolidale> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameAnotherController = TextEditingController();
  final TextEditingController _telepAnotherController = TextEditingController();
int _value = 1;
int _valueDisable = 3;

  bool forAnother = false;

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

  bool yes = false;
  String disabile = 'no';
  bool? familiare;
  bool? personale;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    final bloc = BlocProvider.of<SendDisabiliDataBloc>(context);

    return BlocBuilder<SendDisabiliDataBloc, SendDisabiliDataState>(
        builder: (context, state) {
      return state is SendDisabiliDataLoadingState
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
                    'Taxi Solidale',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _formSelectService(),
                          Padding(
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
                           Row(
        children: [
         
           Radio(
          
          value: 3, groupValue: _valueDisable, onChanged: (value){
            setState(() {
              _valueDisable = value!;
            });
          }),
          SizedBox(
            width: 10,
          ),
           Text('No'),
        ],
       ),Row(
        children: [
           Radio(
          
          value: 4, groupValue: _valueDisable, onChanged: (value){
            setState(() {
              _valueDisable = value!;
            });
          }),
           SizedBox(
            width: 10,
          ),
           Text('Sì'),
        ],
       ),
                          _valueDisable == 3
                              ? SizedBox()
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20.0),
                                  child: DropdownButtonHideUnderline(
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
                                                  overflow: TextOverflow
                                                      .ellipsis,
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
                                            color: ColorConstants
                                                .orangeGradients1,
                                          ),
                                          color: Colors.white,
                                        ),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                        iconSize: 20,
                                        iconEnabledColor: ColorConstants
                                            .orangeGradients3,
                                        iconDisabledColor: Colors.grey,
                                      ),
                                      dropdownStyleData:
                                          DropdownStyleData(
                                        maxHeight: 200,
                                        width: MediaQuery.of(context)
                                                .size
                                                .width -
                                            150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: Colors.white,
                                        ),
                                        scrollbarTheme:
                                            ScrollbarThemeData(
                                          radius:
                                              const Radius.circular(40),
                                          thickness: MaterialStateProperty
                                              .all<double>(6),
                                          thumbVisibility:
                                              MaterialStateProperty.all<
                                                  bool>(true),
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
                                ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                    CommonStyleButton(
            title: 'Clicca per essere contattato',
            iconWidget: Icon(Icons.contact_phone),
            onTap: () {
            
              /*FocusScope.of(context).unfocus();
                                    bloc.add(SignUpTappedEvent()); */
            },
          ),
                ])),
          );
    });
  }

   _formSelectService() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Flexible(
                  child: Text(
                'Vorrei accedere al Servizio Taxi Solidale per:',
              )),
            ],
          ),
        ),
       Row(
        children: [
         
           Radio(
          
          value: 1, groupValue: _value, onChanged: (value){
            setState(() {
              _value = value!;
            });
          }),
          SizedBox(
            width: 10,
          ),
           Text('Me'),
        ],
       ),Row(
        children: [
           Radio(
          
          value: 2, groupValue: _value, onChanged: (value){
            setState(() {
              _value = value!;
            });
          }),
           SizedBox(
            width: 10,
          ),
           Text('Un Mio Familiare'),
        ],
       ),
        /* Row(
              children: [
                
                Checkbox(
                    value: true,
                    tristate: true,
                    onChanged: (value) {
                      setState(() {
                        personale = value!;
                        familiare = false;
                      });
                    }),
                Text('Me'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: false,
                    tristate: false,
                    onChanged: (value) {
                      setState(() {
                        familiare = value!;
                        personale = false;
                      });
                    }),
                Text('Un Mio Familiare'),
              ],
            ), */
       
        SizedBox(
          height: 20,
        ),
        _value == 2
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
            : SizedBox(),
      ],
    );
  }

}





