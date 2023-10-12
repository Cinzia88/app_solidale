import 'package:flutter/material.dart';

import '../widget/background_style_form_profile.dart';
import '../widget/custom_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: const Stack(
          children: [
            BackgroundStyleProfile(),
            CustomProfile(),
          ],
        ),
      ),
    );
  }
}
