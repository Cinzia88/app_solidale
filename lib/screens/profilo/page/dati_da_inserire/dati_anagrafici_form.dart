import 'package:app_solidale/screens/profilo/page/dati_da_inserire/bloc/profile_bloc.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/repository/insert_data_repository.dart';
import 'package:flutter/material.dart';

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dati_form.dart';

class FormProfilePage extends StatefulWidget {
  @override
  State<FormProfilePage> createState() => _FormProfilePageState();
}

class _FormProfilePageState extends State<FormProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileDataBloc>(
      create: (context) => ProfileDataBloc(
        context: context,
        dataProfileRepository: context.read<InsertDataRepository>(),
      ),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => Navigator.pop(context), arrow: true )),
        body: BlocConsumer<ProfileDataBloc, ProfileDataState>(
          listener: (context, state) {
             if (state is ProfileDataErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(child: FormDatiAnagrafici());
          }
        ),
      ),
    );
  }
}
