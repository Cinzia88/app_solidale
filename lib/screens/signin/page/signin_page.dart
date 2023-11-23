
import 'package:app_solidale/screens/presentation/page/presentation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common_widgets/background_style/custom_appbar.dart';
import '../../forget_password/page/forget_password_page.dart';
import '../bloc/signin_bloc.dart';
import '../repository/signin_repository.dart';
import 'form_login.dart';

class SignInPage extends StatefulWidget {
  
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {





  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(
                    context: context,
                    signInRepository: context.read<SignInRepository>(),
                  ),
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PresentationPage())), arrow: true )),
          body: BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) {
             if (state is SignInErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if(state is ScreenCreateAccountState) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PresentationPage()));
            } else if(state is ScreenResetPasswordState) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ForgetPasswordPage()));
            }
          }, builder: (context, state) {
             
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginForm(),
                  ],
                ),
              ),
            );
          })),
    );
  }
}


/*  Column(
        children: [
          CustomContainerService(),
                  CustomContainerService(),
          CustomContainerService(),
    
        ],
      ), */