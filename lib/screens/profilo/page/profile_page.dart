import 'package:anf_app/screens/profilo/widget/custom_page_profile.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
    
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child:   Stack(
                  children: [
              BackgroundStyle(),
          CustomCardProfile(),
                  ],
                ),
            ),
          ),
    );
  }
}
