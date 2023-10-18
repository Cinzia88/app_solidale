import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style_presentation.dart';
import '../widgets/custom_cards.dart';

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
              child:   Stack(
                  children: [
              BackgroundStylePresentationPage(),
                   CustomCard(),
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