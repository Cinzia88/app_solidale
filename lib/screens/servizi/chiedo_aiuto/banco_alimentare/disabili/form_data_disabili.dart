import 'dart:convert';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/carica_docs_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/repo/edit_docs_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/edit_banco_alim/edit_banco_alim.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/model/model_disabili.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/repo/edit_disabili_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_send/send_disabili_bloc.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class FormDataDisabili extends StatefulWidget {
  FormDataDisabili({Key? key}) : super(key: key);

  @override
  State<FormDataDisabili> createState() => _FormDataDisabiliState();
}

class _FormDataDisabiliState extends State<FormDataDisabili> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  bool? disabiliIncompleti;

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
DisabiliData? dataDisabili;


  @override
  void initState() {
    getDisabili();
    EditDocsRepository().getDocsData(context);
    super.initState();
  }


  Future getDisabili() async {
    var data = await EditDataDisabiliRepository().getDisabiliData(context);
    if(data!.disabile.isEmpty || data.numeroDisabili.isEmpty) {
setState(() {
  dataDisabili = null;
});
    } else {
      setState(() {
  dataDisabili = data;
});
    }
  }

  

 

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
                          'Fase 2 di 3',
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
                                  activeColor: ColorConstants.orangeGradients3,
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
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: TextFormFieldCustom(
                                        keyboardType: TextInputType.number,
                                        labelTextCustom:
                                            'Inserisci numero di persone con invalidità',
                                        textEditingController:
                                            _numberController,
                                        obscureText: false,
                                          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Campo Richiesto*';
            }
            return null;
          },)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          dataDisabili != null
                              ? CommonStyleButton(
                                  title: 'Invia e Continua',
                                  iconWidget: Text(''),
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      print('edit si disabili');

                                      EditDataDisabiliRepository()
                                          .editDataDisabili(
                                              context,
                                              globals.dataDisabili!.id,
                                              disabile == 0
                                                  ? '0'
                                                  : _numberController.text,
                                              disabile);

                                                 if(globals.listDocsData.isEmpty) {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => CaricaDocsPage()));
                                    } else {
                                                                            Navigator.push(context, MaterialPageRoute(builder: (_) => IntroBancoAlimentareEdit()));

                                    }
                                    }}   
                                       
                                )
                              : CommonStyleButton(
                                  title: 'Invia e Continua',
                                  iconWidget: Text(''),
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      bloc.add(SendDisabiliFormEvent(
                                          numeroDisabili: disabile == 0
                                              ? '0'
                                              : _numberController.text,
                                          disabile: disabile));
                                     if(globals.listDocsData.isEmpty) {
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => CaricaDocsPage()));
                                    } else {
                                                                            Navigator.push(context, MaterialPageRoute(builder: (_) => IntroBancoAlimentareEdit()));

                                    }
                                    
                                    }}
                                ),
                        ],
                      ),
                    ),
                  ])),
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