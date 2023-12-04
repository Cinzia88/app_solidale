import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/offro%20aiuto/page/form_offro_aiuto_phone.dart';
import 'package:app_solidale/screens/servizi/page_service/bloc/send_phone_bloc.dart';
import 'package:app_solidale/screens/servizi/page_service/form_phone.dart';
import 'package:app_solidale/screens/servizi/page_service/repository/send_phone_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormOffroAiuto extends StatefulWidget {


  @override
  State<FormOffroAiuto> createState() => _FormServizioState();
}

class _FormServizioState extends State<FormOffroAiuto> {
 

  @override
  Widget build(BuildContext context) {
     //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
   
    return BlocProvider<SendPhoneBloc>(
      create: (context) => SendPhoneBloc(
        context: context, 
        sendPhoneRepository: context.read<SendPhoneRepository>()),
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
        body: BlocConsumer<SendPhoneBloc, SendPhoneState>(
              listener: (context, state) {
            if (state is SendPhoneErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          }, builder: (context, state) {
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
                FormOffroAiutoPhone(),
              ],
            ),
          ),
      );
          }
        ),
      ),
    );
  }

 



}
