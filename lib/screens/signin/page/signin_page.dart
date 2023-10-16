
import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style.dart';
import '../widget/form_login.dart';

class SignInPage extends StatefulWidget {


  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(

          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child:   Stack(
                children: [
            BackgroundStyle(),
                 SingleChildScrollView(child:  LoginForm()),
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