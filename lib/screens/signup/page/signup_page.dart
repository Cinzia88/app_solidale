import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common_widgets/background_style/custom_appbar.dart';
import '../../signin/page/signin_page.dart';
import '../bloc/signup_bloc.dart';
import '../repository/signup_repository.dart';
import '../widget/form_signup.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
 
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
          appBar: AppBar(
              toolbarHeight: 75.0,
              automaticallyImplyLeading: false,
              flexibleSpace: customAppBar(context: context)),
          body: BlocConsumer<SignUpBloc, SignUpState>(
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
            if(state is SignupLoadingState) {
              return loadingWidget(context);
            }
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignUpForm(),
                  ],
                ),
              ),
            );
          })),
    );
  }
}


