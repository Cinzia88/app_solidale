import 'package:anf_app/screens/settings/widget/change_password.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: ChangePasswordForm()),
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