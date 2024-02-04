
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/bloc/send_parents_data_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/form_data_parents/form_data_parents.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/repository/send_parents_data_repository.dart';

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';

import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/repo/edit_disabili_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ParentsPage extends StatefulWidget {
  const ParentsPage({super.key});

  @override
  State<ParentsPage> createState() => _ParentsPageState();
}

class _ParentsPageState extends State<ParentsPage> {


     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDisabili();
  }

  Future getDisabili() async {
   try {
      await EditDataDisabiliRepository().getDisabiliData(context);
   } catch (e) {
     print(e);
   }
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SendParentsDataBloc>(
      create: (context) => SendParentsDataBloc(
        context: context,
        sendDataParentsRepository: context.read<SendDataParentsRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 75.0,
          automaticallyImplyLeading: true,
          flexibleSpace: customAppBar(context: context),
       
        ),
        drawer: NavigationDrawerWidget(),
        body: BlocConsumer<SendParentsDataBloc, SendParentsDataState>(
          listener: (context, state) {
            if (state is SendParentsDataErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return FormDataParents();
          },
        ),
        
      ),
    );
  }
}



/*     List<ParentsData> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var nome = nomeComponente[i].text;
      var anni = anniComponente[i].text;
      var grado = gradoComponente[i].text;
      service.sendDataParents(context, nome, anni, grado);
    } */