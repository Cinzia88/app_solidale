

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';

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
            Text('ANF TRUCK',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
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
        
        ],
      ),
    );
  }
}


