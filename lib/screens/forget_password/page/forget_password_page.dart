import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/forget_password/bloc/forget_password_bloc.dart';
import 'package:app_solidale/screens/forget_password/repository/forget_password_repository.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common_widgets/background_style/custom_appbar.dart';
import 'forget_password_form.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordBloc>(
      create: (context) => ForgetPasswordBloc(
          context: context,
          forgetPasswordRepository: context.read<ForgetPasswordRepository>()),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage())),
            ),
            toolbarHeight: 75.0,
            flexibleSpace: customAppBar(context: context)),
        body: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
            listener: (context, state) {
          if (state is ForgetPasswordErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          return;
        }, builder: (context, state) {
          if (state is ForgetPasswordLoadingState) {
            return loadingWidget(context);
          }
          return const Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ForgetPasswordForm(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
