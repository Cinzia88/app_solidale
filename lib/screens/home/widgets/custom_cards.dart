import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/servizi/offro%20aiuto/page/form_offro_aiuto.dart';
import 'package:app_solidale/screens/servizi/page/home_chiedo_aiuto.dart';
import 'package:app_solidale/screens/home/widgets/custom_container_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String titleOffroAiuto = "Offro Aiuto";
  String titleChiedoAiuto = "Chiedo Aiuto";

  CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('La tua email non è stata verificata',  style:
                TextStyle(color: Colors.black, fontSize: 2 * blockSizeVertical),),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeChiedoAiuto()));
            },
            child: CustomCardsCommon(
              child: CustomContainerService(
                title: titleChiedoAiuto,
                subtitle: 'Scopri i nostri principali servizi',
                image: PathConstants.onboarding3,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OffroAiutoPage()));
            },
            child: CustomCardsCommon(
              child: CustomContainerService(
                title: titleOffroAiuto,
                subtitle: 'Dona il tuo tempo a chi ne ha bisogno',
                image: PathConstants.offroAiuto,
              ),
            ),
          ),
           SizedBox(
              height: 5 * blockSizeVertical,
            ),
          Text(
            'Vuoi sostenere l\'ANF?',
            style:
                TextStyle(color: Colors.black, fontSize: 2 * blockSizeVertical),
          ),
          ElevatedButton(
            onPressed: () async {
              launchUrlString('https://www.anfam.net/come-sostenerci');
            },
         
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'DONA ORA',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 2 * blockSizeVertical),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

