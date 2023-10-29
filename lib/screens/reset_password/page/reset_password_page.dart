


import 'package:anf_app/main.dart';
import 'package:anf_app/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:anf_app/screens/common_widgets/loading_widget.dart';
import 'package:anf_app/screens/reset_password/bloc/reset_password_bloc.dart';
import 'package:anf_app/screens/reset_password/page/reset_password_form.dart';
import 'package:anf_app/screens/reset_password/repository/reset_password_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      timer!.cancel();
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordBloc>(
      create: (context) => ResetPasswordBloc(
        context: context, 
        resetPasswordRepository: context.read<ResetPasswordRepository>()),
      child: Scaffold(
         appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
                child: customAppBar(context, true)),
        body: BlocConsumer<ResetPasswordBloc,ResetPasswordState>(
           listener: (context, state) {
              if(state is ResetPasswordErrorState) {
                 ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              }
              return;
            },
          builder: (context, state) {
            if(state is ResetPasswordLoadingState) {
                return loadingWidget(context);
              }
            return const Center(
                            child: SingleChildScrollView(
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ResetPasswordForm(),
                                ],
                              ),
                            ),
                          );
          }
        ),
      ),
    );
  }
}