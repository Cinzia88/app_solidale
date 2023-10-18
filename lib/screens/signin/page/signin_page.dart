
import 'package:flutter/material.dart';

import '../../common_widgets/background_style/custom_appbar.dart';
import '../widget/form_login.dart';

class SignInPage extends StatefulWidget {


  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:    PreferredSize(
          
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context, true)
        ),
        body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(child: LoginForm()),
                  ],
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