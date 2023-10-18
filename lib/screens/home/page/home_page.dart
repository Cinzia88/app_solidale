import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/const/path_constants.dart';

import 'package:flutter/material.dart';

import '../../common_widgets/background_style/custom_appbar.dart';

import '../../common_widgets/custom_cards_common.dart';
import '../../presentation/widgets/custom_container_service.dart';
import '../widget/custom_cards_sevice.dart';
import '../widget/custom_carousel.dart';
import '../widget/listview_cards.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Text('Vuoi dare il tuo contributo volontario', style: TextStyle(color: ColorConstants.orangeGradients3, fontWeight: FontWeight.bold, fontSize: 20),)
        ],
      ),
    );
  }
}
