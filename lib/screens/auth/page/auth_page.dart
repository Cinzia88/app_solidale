import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style.dart';
import '../../auth/widget/custom_cards_auth.dart';

// ignore: must_be_immutable
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: [
        BackgroundStyle(),
        CustomCardsAuth(),
      ],
    ));
  }
}


/*  Column(
        children: [
          CustomContainerService(),
                  CustomContainerService(),
          CustomContainerService(),
    
        ],
      ), 
      
      
      SingleChildScrollView(

          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child:   Stack(
                children: [
          const  BackgroundStyle(),
                             CustomCard(),

                ],
              ),
          ),
        ))*/