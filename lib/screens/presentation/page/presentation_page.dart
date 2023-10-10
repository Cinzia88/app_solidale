
import 'package:anf_app/screens/presentation/widgets/custom_cards.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style.dart';

class PresentationPage extends StatefulWidget {
  String imageBg;
  bool? button;
  PresentationPage({
    Key? key,
    required this.imageBg,
    this.button,
  }) : super(key: key);

  @override
  State<PresentationPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<PresentationPage> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(

          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child:   Stack(
                children: [
            BackgroundStyle(image: widget.imageBg, button: widget.button,),
                             CustomCard(),

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