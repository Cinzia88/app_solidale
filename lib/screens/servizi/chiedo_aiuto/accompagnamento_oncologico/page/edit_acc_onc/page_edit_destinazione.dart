

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/destinazione_page.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';








class DestinationEditPage extends StatefulWidget {
 

  @override
  State<DestinationEditPage> createState() => _DestinationEditPageState();
}

class _DestinationEditPageState extends State<DestinationEditPage> {
    final _formKey = GlobalKey<FormState>();
      final TextEditingController _partenzaController = TextEditingController();
  final TextEditingController _destinazioneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
 //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return  BlocProvider<SendDataTypeServiceBloc>(
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
        }
      }, builder: (context, state) {
              return state is SendDataTypeServiceLoadingState 
                ? loadingWidget(context)
                :SingleChildScrollView(
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
                        child:  Column(
                          children: [
                           
                          Text('Modifica indirizzo di partenza (indirizzo di residenza):'),
                          SizedBox(
                            height: 20,
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
                                 Text('Modifica destinazione (struttura sanitaria):'),
                          SizedBox(
                            height: 20,
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
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                       CommonStyleButton(
                              title: 'Aggiorna',
                              onTap: () {
                                SendDataTypeServiceRepository().sendDataTypeservice(context: context, serviceId:  '3',
                                  nome:   'widget.nomeDestinatario',
                                  telefono:  ' widget.telefonoDestinatario',
                                  partenza:   _partenzaController.text,
                                  destinazione:  _destinazioneController.text);
                             
                                SendDataTypeServiceRepository().sendMailService(
                                    context, 'Accompagnamento Oncologico');
                  
                                FocusScope.of(context).unfocus();
                              },
                              iconWidget: Text('')),
                        ],
                      ),
                    ])),
              );
            }
          ),
        ),
      );
    
  }
}

