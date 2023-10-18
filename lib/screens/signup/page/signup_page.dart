import 'package:anf_app/screens/signup/bloc/signup_bloc.dart';
import 'package:anf_app/screens/signup/repository/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/color_constants.dart';
import '../../common_widgets/background_style/custom_appbar.dart';
import '../../signin/page/signin_page.dart';
import '../widget/form_signup.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context, true)
        ),
        body: BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(
                  context: context,
                  signupRepository: context.read<SignupRepository>(),
                ),
            child: BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
              if (state is NextSignInPageState) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => SignInPage()));
              } else if (state is SignupErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            }, builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(child: SignUpForm()),
                  ],
                ),
              );
            })));
  }
}


/*  Column(
        children: [
          CustomContainerService(),
                  CustomContainerService(),
          CustomContainerService(),
    
        ],
      ), */