import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/bloc/edit_disabili_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/repo/edit_disabili_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/widget/edit_taxi_solidale.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int _value = 1;

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

class DisabiliTaxiPageEdit extends StatefulWidget {
  const DisabiliTaxiPageEdit({super.key});

  @override
  State<DisabiliTaxiPageEdit> createState() => _DisabiliTaxiPageState();
}

class _DisabiliTaxiPageState extends State<DisabiliTaxiPageEdit> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
bool? taxiSolidaleIncompleto;
  bool yes = false;
  int disabile = 0;
  String idDisabile = '';

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;

    return BlocProvider<ReadDisabiliBloc>(
        create: (context) => ReadDisabiliBloc(
              context: context,
              editDataDisabiliRepository:
                  context.read<EditDataDisabiliRepository>(),
            )..add(FetchDisabiliEvent()),
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
            body: BlocConsumer<ReadDisabiliBloc, ReadDisabiliState>(
                listener: (context, state) {
              if (state is ReadDisabiliErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              } else if (state is ReadDisabiliLoadedState) {
                if (state.data.numeroDisabili != '' &&
                    state.data.disabile == '1') {
                  _numberController.text = state.data.numeroDisabili;
                  setState(() {
                    yes = true;
                    disabile = int.parse(state.data.disabile);
                  });
                }
                setState(() {
                  idDisabile = state.data.id;
                });
              }
            }, builder: (context, state) {
              return state is ReadDisabiliLoadingState ||
                      state is EditDisabiliLoadingState
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
                                  'Modifica Dati Disabilità Familiare',
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
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            child: Text(
                                                'Nel nucleo familiare sono presenti persone con invalidità?')),
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
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: TextFormFieldCustom(
                                                keyboardType:
                                                    TextInputType.number,
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CommonStyleButton(
                                            title: 'Aggiorna',
                                            onTap: () async{
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                EditDataDisabiliRepository()
                                                    .editDataDisabili(
                                                        context,
                                                        idDisabile,
                                                        disabile == 0
                                                            ? '0'
                                                            : _numberController
                                                                .text,
                                                        disabile);
                                                         
                                               Navigator.push(context, MaterialPageRoute(builder: (_) => TaxiSolidaleEditPage()));

                                                FocusScope.of(context)
                                                    .unfocus();
                                              }
                                            },
                                            iconWidget: Text('')),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ])),
                    );
            })));
  }
}
