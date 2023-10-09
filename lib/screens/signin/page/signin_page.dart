import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/const/text_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_button.dart';
import 'package:anf_app/screens/common_widgets/custom_textfield.dart';
import 'package:anf_app/screens/signup/page/signup_page.dart';
import 'package:anf_app/screens/styles/layers/layer_one.dart';
import 'package:anf_app/screens/styles/layers/layer_three.dart';
import 'package:anf_app/screens/styles/layers/layer_two.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: 
      SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFFff7b00),
                  const Color(0xFFffdd00),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 200,
                left: 59,
                child: Container(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )),
                 Positioned(top: 290, right: 0, bottom: 0, child: LayerOne()),
              Positioned(top: 318, right: 0, bottom: 28, child: LayerTwo()),
              Positioned(top: 320, right: 0, bottom: 48, child: LayerThree()),
            ],
          ),
        ),
      ),
      
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