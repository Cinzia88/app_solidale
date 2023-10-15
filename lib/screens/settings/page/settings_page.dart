import 'package:anf_app/screens/settings/widget/change_password.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child:  Stack(
          children: [
            BackgroundStyle(),
            ChangePasswordForm(),
          ],
        ),
      ),
    ));
  }
}


/*  Column(
        children: [
          CustomContainerService(),
                  CustomContainerService(),
          CustomContainerService(),
    
        ],
      ), */