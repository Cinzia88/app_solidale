import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/bloc/send_disabili_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FormDataDisabiliTaxi extends StatefulWidget {
  FormDataDisabiliTaxi({Key? key}) : super(key: key);

  @override
  State<FormDataDisabiliTaxi> createState() => _FormDataDisabiliTaxiState();
}

class _FormDataDisabiliTaxiState extends State<FormDataDisabiliTaxi> {
  final _formKey = GlobalKey<FormState>();

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
  int disabile = 0;

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    final bloc = BlocProvider.of<SendDisabiliDataBloc>(context);

    return BlocBuilder<SendDisabiliDataBloc, SendDisabiliDataState>(
        builder: (context, state) {
      return state is SendDisabiliDataLoadingState
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
                            PathConstants.taxiSolidale,
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Fase 2 di 2',
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        child: Text(
                                            'Nel nucleo familiare è presente una persona con invalidità?')),
                                  ],
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
                                            disabile = 1;
                                          });
                                        } else {
                                          disabile = 0;
                                        }

                                        //a secoonda del value che può essere falso o vero e va ad aggiornare il valore _isSecured
                                        //tale value lo salvo nel provider
                                      }),
                                ),
                                disabile == 0
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
                      ])),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CommonStyleButton(
                            title: 'Invia',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                bloc.add(SendDisabiliFormEvent(
                                    numeroDisabili:
                                        disabile == 0 ? '0' : selectedValue,
                                    disabile: disabile));
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: Image.asset(PathConstants.taxiSolidale),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Stiamo elaborando i tuoi dati',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                                        content: const Text(
                                            'Ti contatteremo al più presto!'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        actions: [
                                          InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PresentationPage()));
                                              },
                                              child: Text(
                                                'Torna alla home',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ))
                                        ],
                                      );
                                    });
                              }
                            },
                            iconWidget: Text('')),
                      ],
                    ),
                  ),
                ),
              ],
            );
    });
  }
}





/*const Padding(
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
                                ), */