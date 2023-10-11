
import 'package:anf_app/screens/signin/page/signin_page.dart';
import 'package:anf_app/screens/signup/page/signup_page.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style.dart';
import '../../signin/widget/form_login.dart';
import '../widgets/custom_cards.dart';
import '../widgets/custom_cards_auth.dart';

// ignore: must_be_immutable
class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(

          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: const  Stack(
                children: [
            BackgroundStyle(),
                 CustomCardsAuth(),
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