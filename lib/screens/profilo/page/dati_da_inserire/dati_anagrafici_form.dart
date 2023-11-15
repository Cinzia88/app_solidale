import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/chiedo_aiuto/bloc/profile_bloc.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/chiedo_aiuto/repository/insert_data_repository.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/dati_form.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/dati_form_offro_aiuto.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/offro_aiuto/bloc/profile_offro_aiuto_bloc.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/offro_aiuto/repository/insert_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;


class FormProfilePage extends StatefulWidget {
  String? offroAiuto;
  FormProfilePage(this.offroAiuto);
  @override
  State<FormProfilePage> createState() => _FormProfilePageState();
}

class _FormProfilePageState extends State<FormProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  globals.typeRichiesta! == 'Offro Aiuto' || widget.offroAiuto == 'Offro Aiuto' ?  BlocProvider<OffroAiutoDataBloc>(
      create: (context) => OffroAiutoDataBloc(
        context: context,
        dataProfileOffroAiutoRepository: context.read<InsertDataOffroAiutoRepository>(),
      ),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => Navigator.pop(context), arrow: true )),
        body: BlocConsumer<OffroAiutoDataBloc, OffroAiutoDataState>(
          listener: (context, state) {
             if (state is OffroAiutoDataErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(child: 
           
            FormDatiAnagraficiOffroAiuto());
          }
        ),
      ),
    ) : BlocProvider<ProfileChiedoAiutoBloc>(
      create: (context) => ProfileChiedoAiutoBloc(
        context: context,
        dataProfileRepository: context.read<InsertDataChiedoAiutoRepository>(),
      ),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => Navigator.pop(context), arrow: true )),
        body: BlocConsumer<ProfileChiedoAiutoBloc, ProfileDataState>(
          listener: (context, state) {
             if (state is ProfileDataErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(child: 
           
            FormDatiAnagrafici());
          }
        ),
      ),
    );
  }
}
