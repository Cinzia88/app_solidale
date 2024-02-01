import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/destinazione/destination_taxi_page.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

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
  bool create = false;
  bool taxiSolidaleIncompleto = false;
  bool disabiliTaxiIncompleti = false;
  bool destinazioneTaxiIncompleto = false;
  bool filesTaxiIncompleti = false;

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
  bool? familiare;
  bool? personale;

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;

    return SingleChildScrollView(
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
                  'Fase 1 di 4',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const Divider(
              color: ColorConstants.orangeGradients3,
            ),
            Form(
              key: _formKey,
              child: _formSelectService(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonStyleButton(
                    title: 'Invia e Continua',
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DestinationTaxiPage(
                                    nomeDestinatario: _value == 1
                                        ? globals.userData!.nome
                                        : _nameAnotherController.text,
                                    telefonoDestinatario: _value == 1
                                        ? globals.userData!.telefono
                                        : _telepAnotherController.text)));
                        setState(() {
                          taxiSolidaleIncompleto = true;
                          destinazioneTaxiIncompleto = true;
                          disabiliTaxiIncompleti = true;
                          filesTaxiIncompleti = true;
                        });
                        await ValueSharedPrefsViewSlide()
                            .setProfiloIncompletoUtenteTaxi(
                                taxiSolidaleIncompleto);
                        await ValueSharedPrefsViewSlide()
                            .setProfiloIncompletoUtenteDestinazioneTaxi(
                                destinazioneTaxiIncompleto);

                        await ValueSharedPrefsViewSlide()
                            .setProfiloIncompletoUtenteDisabili(
                                disabiliTaxiIncompleti);

                                 await ValueSharedPrefsViewSlide()
                            .setProfiloIncompletoUtenteFilesTaxi(
                                filesTaxiIncompleti);
                      }
                    },
                    iconWidget: Text('')),
              ],
            ),
          ])),
    );
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
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                }),
            SizedBox(
              width: 10,
            ),
            Text('Me'),
          ],
        ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
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









/* setState(() {
                                  globals.profiloCompleto = false;
                                });
                                ValueSharedPrefsViewSlide().setProfiloCompleto(globals.profiloCompleto!); */