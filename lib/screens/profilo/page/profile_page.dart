import 'package:anf_app/screens/common_widgets/background_style/background_style.dart';
import 'package:flutter/material.dart';

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
            BackgroundStyle(),
            CustomProfile(),
          ],
        ),
      ),
    );
  }
}
