import 'package:flutter/material.dart';

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
                    ForgetPasswordForm(),
                  ],
                ),
              ),
            
    ),);
  }
}
