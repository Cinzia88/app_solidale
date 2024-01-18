import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class OffroAiutoPage extends StatefulWidget {
  const OffroAiutoPage({super.key});

  @override
  State<OffroAiutoPage> createState() => _OffroAiutoPageState();
}

class _OffroAiutoPageState extends State<OffroAiutoPage> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
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
          //final screenWidth = MediaQuery.of(context).size.width;
          final mediaQueryData = MediaQuery.of(context);
          final screenHeight = mediaQueryData.size.height;
          //final blockSizeHorizontal = screenWidth / 100;
          final blockSizeVertical = screenHeight / 100;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Offro Aiuto',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(
                    color: ColorConstants.orangeGradients3,
                  ),
                const  SizedBox(
                    height: 20,
                  ),
                   Text(
                      'Desideri donare il tuo tempo e particolare attenzione a chi ha più bisogno?',
                       style: TextStyle(
                      fontSize: blockSizeVertical * 2,
                    ),),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'SEI IL BENVENUTO!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Puoi partecipare come volontario a tante iniziative di solidarietà attivate presso la nostra associazione, per garantire soluzioni concrete a persone in stato di vulnerabilità. \nSarai contattato per fissare un colloquio, nel corso del quale, possiamo concordare modi e tempi ideali.',
                    style: TextStyle(
                      fontSize: blockSizeVertical * 2,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CommonStyleButton(
                    title: 'Clicca per essere contattato',
                    iconWidget: Icon(Icons.contact_phone),
                    onTap: () {
                      SendDataTypeServiceRepository().sendDataTypeservice(
                      context:  context,
                      serviceId:  '1',
                     nome:   globals.userData!.nome,
                     telefono:   globals.userData!.telefono,
                     partenza:   '',
                     destinazione:   '',
                      );

                      SendDataTypeServiceRepository()
                          .sendMailService(context, 'Offro Aiuto');

                      /*FocusScope.of(context).unfocus();
                                                bloc.add(SignUpTappedEvent()); */
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
