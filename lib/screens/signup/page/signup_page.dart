import 'package:anf_app/screens/common_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../const/color_constants.dart';
import '../../common_widgets/background_style/custom_appbar.dart';
import '../../presentation/page/presentation_page.dart';
import '../../signin/page/signin_page.dart';
import '../bloc/signup_bloc.dart';
import '../repository/signup_repository.dart';
import '../widget/form_signup.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  String service;
   SignUpPage({
    Key? key,
    required this.service,
  }) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(
                    context: context,
                    signupRepository: context.read<SignupRepository>(),
                  ),
      child: Scaffold(
          appBar: PreferredSize(
            
            preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PresentationPage())), arrow: true ),
          ),
          body: BlocConsumer<SignUpBloc, SignUpState>(
              listener: (context, state) {
            if (state is NextSignInPageState) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => SignInPage()));
            } else if (state is SignupErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if(state is SignUpSuccessState) {
               ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
        backgroundColor: ColorConstants.orangeGradients3,
        content: Text('inviato link di conferma',
       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
       ))
              );
                
            }
          }, builder: (context, state) {
            if(state is SignupLoadingState) {
              return loadingWidget(context);
            }
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignUpForm(service: widget.service),
                  ],
                ),
              ),
            );
          })),
    );
  }
}


