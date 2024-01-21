import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/bloc/read_request_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class TaxiSolidaleEditDataDestinatarioPage extends StatefulWidget {
  
  @override
  State<TaxiSolidaleEditDataDestinatarioPage> createState() => _TaxiSolidaleEditDataDestinatarioPageState();
}

class _TaxiSolidaleEditDataDestinatarioPageState extends State<TaxiSolidaleEditDataDestinatarioPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTaxiAnotherController = TextEditingController();
  final TextEditingController _telepTaxiAnotherController = TextEditingController();
  int _value = 1;
  String idTaxiSolidaleEdit = '';

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
                  if (state.data[i].nome != globals.userData!.nome &&
                      state.data[i].telefono != globals.userData!.telefono) {
                    _nameTaxiAnotherController.text = state.data[i].nome;
                    _telepTaxiAnotherController.text = state.data[i].telefono;
                  }
                  setState(() {
               idTaxiSolidaleEdit = state.data[i].idRequest;
             });
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
                                Text(
                                  'Modifica Dati Destinatario',
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
                                    title: 'Aggiorna',
                                    onTap: () {
                                      EditDataTypeServiceRepository()
                                          .editRequest(
                                        context,
                                       idTaxiSolidaleEdit,
                                        '2',
                                          _value == 1 ? globals.userData!.nome : _nameTaxiAnotherController.text, 
                                  _value == 1 ? globals.userData!.telefono : _telepTaxiAnotherController.text,
                                  '',
                                  '',
                                      );

                                    
                                      FocusScope.of(context).unfocus();
                                    },
                                    iconWidget: Text('')),
                              ],
                            ),
                          ])),
                    );
            })));
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
                      textEditingController: _nameTaxiAnotherController,
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
                      textEditingController: _telepTaxiAnotherController,
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
