


import 'package:anf_app/screens/new_password/new_password_form.dart';
import 'package:flutter/material.dart';


class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
                    child: SingleChildScrollView(
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NewPasswordForm(),
                        ],
                      ),
                    ),
                  );
  }
}