import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/bloc/read_user_bloc.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;
import '../../common_widgets/background_style/background_style_presentation.dart';
import '../widgets/custom_cards.dart';

// ignore: must_be_immutable
class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {

 

  @override
  Widget build(BuildContext context) {
    return   BlocProvider<ReadUserBloc>(
      create: (context) => ReadUserBloc(
        context: context,
        readDataUserRepository: context.read<ReadDataUserRepository>(),
      )..add(
          FetchUserEvent(),
        ),
      child:
          BlocConsumer<ReadUserBloc, ReadUserState>(listener: (context, state) {
        if (state is ReadUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
        return;
      },
      builder: (context, state) {
         if (state is ReadUserLoadedState) {
                    globals.userData = state.data;

        return Scaffold(
          body: SingleChildScrollView(
        
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                  child:   Stack(
                      children: [
                  BackgroundStylePresentationPage(),
                       CustomCard(),
                      ],
                    ),
                ),
              ),
        );
      }
       return loadingWidget(context);
      } 
     
          ),
    );
  }
}

