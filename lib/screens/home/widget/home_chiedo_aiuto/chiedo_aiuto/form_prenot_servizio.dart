import 'package:app_solidale/const/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../common_widgets/custom_textfield.dart';

class FormPrenotazioneServizio extends StatefulWidget {
  const FormPrenotazioneServizio({super.key});

  @override
  State<FormPrenotazioneServizio> createState() =>
      _FormPrenotazioneServizioState();
}

class _FormPrenotazioneServizioState extends State<FormPrenotazioneServizio> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _oraController = TextEditingController();
  final TextEditingController _fromAddressController = TextEditingController();
  final TextEditingController _toAddressController = TextEditingController();
  final TextEditingController _nameAnotherController = TextEditingController();
  final TextEditingController _surnameAnotherController =
      TextEditingController();
  final TextEditingController _telepAnotherController = TextEditingController();

  DateTime date = DateTime.now();
  TimeOfDay? time;
  bool taxy = false;
  bool car = false;
  bool forMe = false;
  bool forAnother = false;

  selectTime(BuildContext context) async {
    TimeOfDay? newSelectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newSelectedTime != null) {
      DateTime parsedTime =
          DateFormat.Hm().parse(newSelectedTime.format(context).toString());

      String formattedTime = DateFormat('HH:mm').format(parsedTime);
      setState(() {
        _oraController.text = formattedTime; //set the value of text field.
      });

      print(time);
    }
  }

  selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      locale: const Locale("it", "IT"),
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    if (newSelectedDate != null) {
      date = newSelectedDate;

      _dataController
        ..text = DateFormat.yMMMd().format(date)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dataController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  Widget buildDateTime() => Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: _dataController,
              onTap: () {
                selectDate(context);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.calendar_today_sharp,
                  color: ColorConstants.orangeGradients3,
                ),
                labelText: 'Data',
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _oraController,
              onTap: () {
                selectTime(context);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.access_time,
                  color: ColorConstants.orangeGradients3,
                ),
                labelText: 'Ora',
              ),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
      

          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Prenotazione Servizi',
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
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Scegli il tipo di servizio:',
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: taxy,
                    onChanged: (taxyValue) {
                      setState(() {
                        taxy = taxyValue!;
                      });
                    }),
                Text('Taxi Solidale'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: car,
                    onChanged: (carValue) {
                      setState(() {
                        car = carValue!;
                      });
                    }),
                Text('Accompagnamento Oncologico'),
              ],
            ),
            buildDateTime(),
            SizedBox(
              height: 10,
            ),
            TextFormFieldCustom(
              textEditingController: _fromAddressController,
              labelTextCustom: 'Indirizzo di partenza:',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo Richiesto*';
                }
                return null;
              },
              obscureText: false,
            ),
            TextFormFieldCustom(
              textEditingController: _toAddressController,
              labelTextCustom: 'Indirizzo di destinazione:',
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo Richiesto*';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('La richiesta di prenotazione è per:'),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: forMe,
                    onChanged: (forMeValue) {
                      setState(() {
                        forMe = forMeValue!;
                        forAnother = false;
                      });
                    }),
                Text('Me medesimo'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: [
                  Checkbox(
                      value: forAnother,
                      onChanged: (forAnotherValue) {
                        setState(() {
                          forAnother = forAnotherValue!;
                          forMe = false;
                        });
                      }),
                  Text('Un altro componente familiare'),
                ],
              ),
            ),
            forAnother == true
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                              '(Inserisci i dati del familiare per il quale richiedi il servizio scelto:)'),
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
              title: 'Prenota',
              iconWidget: Icon(Icons.calendar_month),
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
    );
  }
}
