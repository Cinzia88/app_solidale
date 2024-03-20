import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/bloc/read_request_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/destinazione_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/model/model_disabili.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/repo/edit_disabili_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/disabili/carica_disabili_page_taxi.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/widget/edit_taxi_solidale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class DestinationTaxiEditPage extends StatefulWidget {
  @override
  State<DestinationTaxiEditPage> createState() =>
      _DestinationTaxiEditPageState();
}

class _DestinationTaxiEditPageState extends State<DestinationTaxiEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _partenzaController = TextEditingController();
  final TextEditingController _destinazioneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  bool destinazioneTaxiIncompleto = true;

  String idReq = '';
  String nome = '';
  String telefono = '';
  String partenza = '';
  String destinazione = '';
  String data = '';
  String ora = '';
  DisabiliData? dataDisabili;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDisabili();
    _timeController.text = "";
  }

  Future getDisabili() async {
    var data = await EditDataDisabiliRepository().getDisabiliData(context);
    if (data.disabile.isEmpty || data.numeroDisabili.isEmpty) {
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
    return BlocProvider<ReadRequestBloc>(
      create: (context) => ReadRequestBloc(
        context: context,
        editDataTypeServiceRepository:
            context.read<EditDataTypeServiceRepository>(),
      )..add(FetchRequestEvent()),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 75.0,
          automaticallyImplyLeading: true,
          flexibleSpace: customAppBar(context: context),
          actions: [
            _partenzaController.text == '' ||
                    _destinazioneController.text == '' ||
                    _dateController.text == ''
                ? SizedBox()
                : IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))
          ],
        ),
        drawer: NavigationDrawerWidget(),
        body: BlocConsumer<ReadRequestBloc, ReadRequestState>(
            listener: (context, state) {
          if (state is ReadRequestErrorState) {
                          print(state.errorMessage,);

          } else if (state is ReadRequestLoadedState) {
            for (int i = 0; i < state.data.length; i++) {
              print('state.data ${state.data[i].partenza}');
              if (state.data[i].serviceId == '2') {
                setState(() {
                  idReq = state.data[i].idRequest;

                  nome = state.data[i].nome;
                  telefono = state.data[i].telefono;
                });
                if (state.data[i].partenza == 'null' &&
                    state.data[i].destinazione == 'null' &&
                    state.data[i].data == 'null') {
                  setState(() {
                    _partenzaController.text;
                    _destinazioneController.text;
                    _dateController.text;
                    _timeController.text;
                    partenza = state.data[i].partenza!;
                    destinazione = state.data[i].destinazione!;
                    data = state.data[i].data!;
                    ora = state.data[i].ora!;
                  });
                } else {
                  setState(() {
                    _partenzaController.text = state.data[i].partenza!;
                    _destinazioneController.text = state.data[i].destinazione!;
                    _dateController.text = state.data[i].data!;
                    _timeController.text = state.data[i].ora!;
                  });
                }
              }
            }
          }
        }, builder: (context, state) {
          return state is ReadRequestLoadingState ||
                  state is EditRequestLoadingState
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
                            Flexible(
                              child: Text(
                                partenza == 'null' ||
                                        destinazione == 'null' ||
                                        data == 'null' ||
                                        ora == 'null'
                                    ? 'Fase 2 di 4'
                                    : 'Modifica Partenza/Destinazione',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(partenza == 'null' ||
                                            destinazione == 'null' ||
                                            data == 'null' ||
                                            ora == 'null'
                                        ? 'Inserisci indirizzo di partenza (indirizzo di residenza):'
                                        : 'Modifica indirizzo di partenza (indirizzo di residenza):'),
                                  ),
                                ],
                              ),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(partenza == 'null' ||
                                            destinazione == 'null' ||
                                            data == 'null' ||
                                            ora == 'null'
                                        ? 'Inserisci destinazione (struttura sanitaria):'
                                        : 'Modifica destinazione (struttura sanitaria):'),
                                  ),
                                ],
                              ),
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
                                  partenza == 'null' ||
                                          destinazione == 'null' ||
                                          data == 'null' ||
                                          ora == 'null'
                                      ? Flexible(child: Text('Inserisci data:'))
                                      : Flexible(child: Text('Modifica data:')),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  partenza == 'null' ||
                                          destinazione == 'null' ||
                                          data == 'null' ||
                                          ora == 'null'
                                      ? Flexible(child: Text('Inserisci ora:'))
                                      : Flexible(child: Text('Modifica ora:')),
                                ],
                              ),
                              TextFormFieldCustom(
                                textEditingController:
                                    _timeController, //editing controller of this TextField
                                labelTextCustom: 'Ora:',
                                readOnly: true,
                                obscureText: false,

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo Richiesto*';
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
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

                                  if (pickedTime != null) {
                                    print(pickedTime
                                        .format(context)); //output 10:51 PM
                                    DateTime parsedTime = DateFormat.Hm().parse(
                                        pickedTime.format(context).toString());
                                    //converting to DateTime so that we can further format on different pattern.
                                    print(
                                        'parsed $parsedTime'); //output 1970-01-01 22:53:00.000
                                    String formattedTime =
                                        DateFormat('HH:mm').format(parsedTime);
                                    print(
                                        'formattedTime $formattedTime'); //output 14:59:00
                                    //DateFormat() is from intl package, you can format the time on any pattern you need.

                                    setState(() {
                                      _timeController.text =
                                          formattedTime; //set the value of text field.
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommonStyleButton(
                                title: partenza == 'null' ||
                                        destinazione == 'null' ||
                                        data == 'null' ||
                                        ora == 'null'
                                    ? 'Invia e Continua'
                                    : 'Aggiorna',
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    EditDataTypeServiceRepository().editRequest(
                                        context,
                                        idReq,
                                        '2',
                                        '',
                                        nome,
                                        telefono,
                                        _partenzaController.text,
                                        _destinazioneController.text,
                                        _dateController.text,
                                        _timeController.text);

                                    if (dataDisabili == null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  DisabiliTaxiPage()));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  TaxiSolidaleEditPage()));
                                    }

                                    FocusScope.of(context).unfocus();
                                  }
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
