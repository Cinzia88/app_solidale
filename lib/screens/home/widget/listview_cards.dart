


import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';
import 'package:anf_app/screens/presentation/widgets/custom_container_service.dart';
import 'package:flutter/material.dart';

import '../../../const/path_constants.dart';

class ListViewCards extends StatefulWidget {
  const ListViewCards({super.key});

  @override
  State<ListViewCards> createState() => _ListViewCardsState();
}

class _ListViewCardsState extends State<ListViewCards> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          GestureDetector(
                onTap: () {
                  
                },
                child: CustomCardsCommon(
                  child: const CustomContainerService(
                    title: 'Prenotazione Servizi',
                    subtitle:
                        'Compila il form per il servizio di tuo interesse',
                    image: PathConstants.servziPrenot,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: CustomCardsCommon(
                  child: const CustomContainerService(
                    title: 'Banco Alimentare',
                    subtitle:
                        'Compila il form per il servizio di tuo interesse',
                    image: PathConstants.servziPrenot,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}