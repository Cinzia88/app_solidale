import 'package:app_solidale/screens/servizi/bloc_edit_service/bloc/edit_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/edit_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/edit_acc_onc/edit_form_acc_onc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/form_acc_onc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccompagnamentoOncologicoEditPage extends StatefulWidget {
  const AccompagnamentoOncologicoEditPage({super.key});

  @override
  State<AccompagnamentoOncologicoEditPage> createState() => _AccompagnamentoOncologicoEditPageState();
}

class _AccompagnamentoOncologicoEditPageState extends State<AccompagnamentoOncologicoEditPage> {
 


  @override
  Widget build(BuildContext context) {
   

    return BlocProvider<EditDataTypeServiceBloc>(
      create: (context) => EditDataTypeServiceBloc(
        context: context,
        editDataTypeServiceRepository:
            context.read<EditDataTypeServiceRepository>(),
      )..add(
                FetchRequestEvent(),
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
          body: BlocConsumer<EditDataTypeServiceBloc, EditDataTypeServiceState>(
            listener: (context, state) {
          if (state is EditDataTypeServiceErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        }, builder: (context, state) {
              return FormEditAccompagnamentoOncologico();
            }
          )),
    );
  
  }
}



