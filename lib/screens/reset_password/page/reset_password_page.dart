import 'package:flutter/material.dart';

import '../../common_widgets/background_style/custom_appbar.dart';
import 'reset_password_form.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
        child: customAppBar(context, true)
      ),
      body: const Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ResetPasswordForm(),
                  ],
                ),
              ),
            
    ),);
  }
}
