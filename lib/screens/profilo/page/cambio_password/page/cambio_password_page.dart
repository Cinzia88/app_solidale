


import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/profilo/page/cambio_password/bloc/change_password_bloc.dart';
import 'package:app_solidale/screens/profilo/page/cambio_password/repository/change_password_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_widgets/background_style/custom_appbar.dart';
import 'change_password_form.dart';

class CambioPasswordPage extends StatefulWidget {
  const CambioPasswordPage({super.key});

  @override
  State<CambioPasswordPage> createState() => _CambioPasswordPageState();
}

class _CambioPasswordPageState extends State<CambioPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<ChangePasswordBloc>(
      create: (context) => ChangePasswordBloc(context: context, changePasswordRepository: context.read<ChangePasswordRepository>()),
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => Navigator.pop(context), arrow: true )),
          body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
            listener: (context, state) {
              if(state is ChangePasswordErrorState) {
                 ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              }
              return;
            },
            builder: (context, state) {
              if(state is ChangePasswordLoadingState) {
                return loadingWidget(context);
              }
              return const Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChangePasswordForm(),
                        ],
                      ),
                    ),
                  );
            }
          )
          ),
    );
  }
}