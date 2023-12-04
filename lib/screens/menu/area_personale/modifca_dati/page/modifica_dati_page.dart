



import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/common_widgets/validator_email/validator_email.dart';
import 'package:app_solidale/screens/home/bloc/read_user_bloc.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;

class ModificaDatiPage extends StatefulWidget {
  const ModificaDatiPage({super.key});

  @override
  State<ModificaDatiPage> createState() => _ModificaDatiPageState();
}

class _ModificaDatiPageState extends State<ModificaDatiPage> {
    final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocProvider<ReadUserBloc>(
      create: (context) => ReadUserBloc(
        context: context,
        readDataUserRepository: context.read<ReadDataUserRepository>(),
      )..add(
          FetchUserEvent(),
        ),
      child: Scaffold(appBar: AppBar(
           iconTheme: const IconThemeData(
            color: Colors.white,
           ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),
             actions: [
              IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back, color: Colors.white,))
            ],
          ),
          drawer: NavigationDrawerWidget(),
        body:    BlocConsumer<ReadUserBloc, ReadUserState>(listener: (context, state) {
        if (state is ReadUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
         if (state is ReadUserLoadedState) {
         _nameController.text = state.data.nome;
         _emailController.text = state.data.email;
        }
        return;
      }, builder: (context, state) {
          return state is ReadUserLoadingState ? loadingWidget(context ) :Center(
            child: SingleChildScrollView(
              child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
            
                children: [
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                       elevation: 10,
                      color: Colors.white,
                      shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                               Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Modifica I Tuoi Dati',
                                                          style: Theme.of(context).textTheme.titleSmall,

                                  ),
                                ],
                              ),
                              const Divider(
                                color: ColorConstants.orangeGradients3,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormFieldCustom(
                                        textEditingController: _nameController,
                                        labelTextCustom: 'Nome e Cognome:',
                                        obscureText: false,
                                      ),
                                     
                                      TextFormFieldCustom(
                                        textEditingController: _emailController,
                                        labelTextCustom: 'Email:',
                                        obscureText: false,
                                        validator: (value) {
                                          if (!Validators.isValidEmail(value!)) {
                                            return 'Inserisci un\' email valida';
                                          }
                                          return null;
                                        },
                                      ),
                                      
                                    SizedBox(
                                      height: 20,
                                    ),
                                      CommonStyleButton(
                                        title: 'Aggiorna',
                                        iconWidget: Icon(Icons.update),
                                        onTap: () {
                                          
                                         
                                          Navigator.pop(context);
                                          /*FocusScope.of(context).unfocus();
                                                bloc.add(SignUpTappedEvent()); */
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          );
          
  }
    ),)
       );
  }
}
