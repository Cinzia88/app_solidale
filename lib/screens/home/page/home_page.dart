import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';
import 'package:anf_app/screens/home/widget/custom_cards_sevice.dart';
import 'package:anf_app/screens/presentation/widgets/custom_container_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/background_style/background_style.dart';
import '../../signup/page/signup_page.dart';
import 'offro aiuto/offro_aiuto_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundStyle(),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 3.5,
              right: 20,
              left: 20),
          child: Column(
            children: [
              CustomCarousel(),
                               GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUpPage()));
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

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => OffroAiutoPage()));
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Material(
                          elevation: 10,
                          color: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30))),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(top: 30.0, bottom: 10),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Vuoi offrire il tuo aiuto?',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: ColorConstants
                                                  .titleText,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                          'Compila il form con i tuoi dati'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 70,
                          child: Image.asset(
                            PathConstants.offroAiuto,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
             
            ],
          ),
        )
      ],
    );
  }
}

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int currentIndex = 0;

List<Widget> container = [
   Stack(
    alignment: FractionalOffset.center,
     children: [
       Container(
               color: ColorConstants.orangeGradients1.withOpacity(0.6),
            ),
            Text('testo',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
     ],
   ),
         Stack(
              alignment: FractionalOffset.center,

     children: [
       Container(
               color: ColorConstants.orangeGradients1.withOpacity(0.6),
            ),
            Text('testo',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
     ],
   ),
     
         Stack(
              alignment: FractionalOffset.center,

     children: [
       Container(
               color: ColorConstants.orangeGradients1.withOpacity(0.6),
            ),
            Text('testo',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
     ],
   ),
     
];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          CarouselSlider(
            
            items: container,
            
            options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.5,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }
                ),
          ),
          SizedBox(
                height: 20,
              ),
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: DotsIndicator(
              dotsCount: container.length,
              position: currentIndex,
              decorator: const DotsDecorator(
                color: ColorConstants.colorDoctNotActive,
                activeColor: ColorConstants.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}


