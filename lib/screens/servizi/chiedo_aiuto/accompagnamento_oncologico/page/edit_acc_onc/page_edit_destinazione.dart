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
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DestinationEditPage extends StatefulWidget {
  @override
  State<DestinationEditPage> createState() => _DestinationEditPageState();
}

class _DestinationEditPageState extends State<DestinationEditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _partenzaController = TextEditingController();
  final TextEditingController _destinazioneController = TextEditingController();
    final TextEditingController _dateController = TextEditingController();

  String idReq = '';
  String nome = '';
  String telefono = '';


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
            IconButton(
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          } else if (state is ReadRequestLoadedState) {
            for (int i = 0; i < state.data.length; i++) {
              if (state.data[i].serviceId == '3') {
                setState(() {
                  idReq = state.data[i].idRequest;
                  _partenzaController.text = state.data[i].partenza!;
                  _destinazioneController.text = state.data[i].destinazione!;
                  nome = state.data[i].nome;
                  telefono = state.data[i].telefono;
                });
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
                            Flexible(
                              child: Text(
                                'Modifica Partenza/Destinazione',
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
                              Text(
                                  'Modifica indirizzo di partenza (indirizzo di residenza):'),
                              SizedBox(
                                height: 10,
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
                                height: 25,
                              ),
                              Text(
                                  'Modifica destinazione (struttura sanitaria):'),
                              SizedBox(
                                height: 10,
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
                             
                              TextFormFieldCustom(
                                textEditingController:
                                    _dateController, //editing controller of this TextField
                                labelTextCustom: 'Data:',
                                readOnly: true,
                                obscureText: false,
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
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommonStyleButton(
                                title: 'Aggiorna',
                                onTap: () {
                                  EditDataTypeServiceRepository().editRequest(
                                      context,
                                      idReq,
                                      '3',
                                      nome,
                                      telefono,
                                      _partenzaController.text,
                                      _destinazioneController.text,
                                      _dateController.text);


                                  

                                  FocusScope.of(context).unfocus();
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
