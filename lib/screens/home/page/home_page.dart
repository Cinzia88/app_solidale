import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/const/path_constants.dart';

import 'package:flutter/material.dart';

import '../../common_widgets/background_style/custom_appbar.dart';

import '../widget/custom_cards_sevice.dart';

import 'offro aiuto/offro_aiuto_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Column(
            children: [
              const Text(
                'Chiedo Aiuto',
                style: TextStyle(
                    color: ColorConstants.titleText,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const Divider(
                color: ColorConstants.orangeGradients3,
              ),
              customCardsService(context),
            ],
          ),
         SizedBox(
          height: 50,
         ),
          Column(
            children: [
              Text(
                'Vuoi contribuire ad aiutare il prossimo?',
                style: TextStyle(
                    color: ColorConstants.orangeGradients3,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
                  const Divider(
                color: ColorConstants.orangeGradients3,
              ),
              Text('Offri il tuo aiuto e condividi le tue competenze.',),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => OffroAiutoPage()));
                  },
                    child: Text('Unisciti a noi', style: TextStyle(decoration: TextDecoration.underline,),)),
                ],
              )
            ],
          ),
               
        ],
      ),
    );
  }
}
