import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/bloc/send_disabili_data_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/page/disabili/form_data_disabili_taxi.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/repository/send_data_disabili_repository.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisabiliTaxiPage extends StatefulWidget {
  const DisabiliTaxiPage({super.key});

  @override
  State<DisabiliTaxiPage> createState() => _DisabiliTaxiPageState();
}

class _DisabiliTaxiPageState extends State<DisabiliTaxiPage> {
 


  @override
  Widget build(BuildContext context) {
   

    return BlocProvider<SendDisabiliDataBloc>(
      create: (context) => SendDisabiliDataBloc(
        context: context,
        sendDisabiliDataRepository: context.read<SendDisabiliDataRepository>(),
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
          body: BlocConsumer<SendDisabiliDataBloc, SendDisabiliDataState>(
              listener: (context, state) {
            if (state is SendDisabiliDataErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          }, builder: (context, state) {
            return FormDataDisabiliTaxi();
  })));
  }
}



/*     List<ParentsData> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var nome = nomeComponente[i].text;
      var anni = anniComponente[i].text;
      var grado = gradoComponente[i].text;
      service.sendDataParents(context, nome, anni, grado);
    } */