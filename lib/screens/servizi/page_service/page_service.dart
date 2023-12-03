import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/const/text_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/home/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/carica_docs_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/carica_parenti_page.dart';
import 'package:app_solidale/screens/servizi/page_service/bloc/send_phone_bloc.dart';
import 'package:app_solidale/screens/servizi/page_service/form_phone.dart';
import 'package:app_solidale/screens/servizi/page_service/repository/send_phone_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormServizio extends StatefulWidget {
  final String title;
  final String image;
  const FormServizio({required this.title, required this.image});

  @override
  State<FormServizio> createState() => _FormServizioState();
}

class _FormServizioState extends State<FormServizio> {
 

  @override
  Widget build(BuildContext context) {
   
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
            return FormPhone(title: widget.title, image: widget.image);
          }
        ),
      ),
    );
  }

 



}
