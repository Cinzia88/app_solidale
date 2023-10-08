import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/screens/signup/service/service.dart';

import 'package:flutter/material.dart';

import '../widget/already_account.dart';
import '../widget/form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorConstants.background,
          titleTextStyle: const TextStyle(
            color: ColorConstants.textTitle,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          title: const Text(
            'Crea Account',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: ListView(shrinkWrap: true, children: [
            const FormSignUp(),
            const SizedBox(
              height: 20,
            ),
            createHaveAccountText(context),
          ]),
        ),
      ),
    );
  }
}


