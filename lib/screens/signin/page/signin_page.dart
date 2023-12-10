
import 'package:app_solidale/screens/signup/page/signup_page.dart';
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
          appBar: AppBar(
              toolbarHeight: 75.0,
              automaticallyImplyLeading: false,
              flexibleSpace: customAppBar(context: context)),
          body:
              BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
            if (state is SignInErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is ScreenCreateAccountState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => SignUpPage()));
            } else if (state is ScreenResetPasswordState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => ForgetPasswordPage()));
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