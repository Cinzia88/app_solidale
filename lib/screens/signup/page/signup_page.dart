import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style.dart';
import '../widget/form_signup.dart';

class SignUpPage extends StatefulWidget {


  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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
           SingleChildScrollView(child:  SignUpForm()),
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