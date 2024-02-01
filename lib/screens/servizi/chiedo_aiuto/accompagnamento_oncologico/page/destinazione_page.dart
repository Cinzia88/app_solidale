import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/edit_acc_onc/page_edit_acc.onc.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DestinationPage extends StatefulWidget {
  String nomeDestinatario;
  String telefonoDestinatario;
  DestinationPage(
      {required this.nomeDestinatario, required this.telefonoDestinatario});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _partenzaController = TextEditingController();
  final TextEditingController _destinazioneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  bool accIncompleto = true;

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocProvider<SendDataTypeServiceBloc>(
      create: (context) => SendDataTypeServiceBloc(
        context: context,
        sendDataTypeServiceRepository:
            context.read<SendDataTypeServiceRepository>(),
      ),
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
        body: BlocConsumer<SendDataTypeServiceBloc, SendDataTypeServiceState>(
            listener: (context, state) {
          if (state is SendDataTypeServiceErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is SendDataTypeServiceLoadingState) {
            loadingWidget(context);
          }
        }, builder: (context, state) {
          return state is SendDataTypeServiceLoadingState
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
                            PathConstants.accompagnamOncolog,
                          ),
                        ),
                        SizedBox(
                          height: 3 * blockSizeVertical,
                        ),
                        Text(
                          'Accompagnamento Oncologico',
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
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Text(
                                  'Inserisci indirizzo di partenza (indirizzo di residenza):'),
                             
                              TextFormFieldCustom(
                                textEditingController: _partenzaController,
                                labelTextCustom: 'Indirizzo di partenza:',
                                obscureText: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo Richiesto*';
                                  }
                                  return null;
                                },
                              ),
                               SizedBox(
                                height: 20,
                              ),
                              Text(
                                  'Inserisci destinazione (struttura sanitaria):'),
                            
                              TextFormFieldCustom(
                                textEditingController: _destinazioneController,
                                labelTextCustom: 'Destinazione:',
                                obscureText: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo Richiesto*';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Text(
                                      'Inserisci data:'),
                               ],
                             ),
                              TextFormFieldCustom(
                                textEditingController:
                                    _dateController, //editing controller of this TextField
                                labelTextCustom: 'Data:',
                                readOnly: true,
                                obscureText: false,
                                 validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo Richiesto*';
                                  }
                                  return null;
                                },
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(
                                        1900), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          colorScheme: const ColorScheme.dark(
                                            primary:
                                                ColorConstants.secondaryColor,
                                            onPrimary: Colors.white,
                                            surface: Colors.white,
                                            onSurface:
                                                ColorConstants.orangeGradients3,
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
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    //you can implement different kind of Date Format here according to your requirement

                                    setState(() {
                                      _dateController.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                              ),
                               SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommonStyleButton(
                                title: 'Invia',
                                onTap: globals.profiloIncompletoAccOnc == true
                                    ? () async {
                                        if (_formKey.currentState!.validate()) {
                                          SendDataTypeServiceRepository()
                                              .sendDataTypeservice(
                                                  context: context,
                                                  serviceId: '3',
                                                  nome: widget.nomeDestinatario,
                                                  telefono: widget
                                                      .telefonoDestinatario,
                                                  partenza:
                                                      _partenzaController.text,
                                                  destinazione:
                                                      _destinazioneController
                                                          .text,
                                                          data: _dateController.text);

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      AccompagnamentoOncologicoEditPage()));

                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            accIncompleto = false;
                                          });
                                          await ValueSharedPrefsViewSlide()
                                              .setProfiloIncompletoUtenteAccOnc(
                                                  accIncompleto);
                                        }
                                      }
                                    : () async {
                                        if (_formKey.currentState!.validate()) {
                                          SendDataTypeServiceRepository()
                                              .sendDataTypeservice(
                                                  context: context,
                                                  serviceId: '3',
                                                  nome: widget.nomeDestinatario,
                                                  telefono: widget
                                                      .telefonoDestinatario,
                                                  partenza:
                                                      _partenzaController.text,
                                                  destinazione:
                                                      _destinazioneController
                                                          .text);

                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            accIncompleto = false;
                                          });
                                          await ValueSharedPrefsViewSlide()
                                              .setProfiloIncompletoUtenteAccOnc(
                                                  accIncompleto);
                                        }

                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                      child: Image.asset(
                                                          PathConstants
                                                              .accompagnamOncolog),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Stiamo elaborando i tuoi dati',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                                content: const Text(
                                                    'Ti contatteremo al più presto!'),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                actions: [
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
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
                                      },
                                iconWidget: Text('')),
                          ],
                        ),
                      ])),
                );
        }),
      ),
    );
  }
}
