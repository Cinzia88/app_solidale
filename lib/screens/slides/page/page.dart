import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/data_constants.dart';
import 'package:app_solidale/screens/signup/page/signup_page.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SlidesPage extends StatefulWidget {
  const SlidesPage({super.key});

  @override
  State<SlidesPage> createState() => _SlidesPageState();
}

class _SlidesPageState extends State<SlidesPage> {
    bool viewSlide = true;
  ValueSharedPrefsViewSlide valueSharedPrefsViewSlide =
      ValueSharedPrefsViewSlide();
  PageController controller = PageController();
  int _curr = 0;
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _curr == 3 ?  Text(
                           "Chiudi" ,
                          style:  TextStyle(
                            color: ColorConstants.titleText,
                            fontSize: 2 * blockSizeVertical,
                            fontWeight: FontWeight.bold,
                          )) : InkWell(
                            onTap: () async {
                              setState(() {
                                viewSlide = false;
                              });
                           
                              await valueSharedPrefsViewSlide
                                  .setValueViewSlide(viewSlide);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                            },
                            child: Text(
                             "Salta" ,
                            style:  TextStyle(
                              color: ColorConstants.titleText,
                              fontSize: 2 * blockSizeVertical,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
            
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              allowImplicitScrolling: true,
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: DataConstants.onboardingTiles,
              onPageChanged: (num) {
                setState(() {
                  _curr = num;
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: DotsIndicator(
              dotsCount: 4,
              position: _curr,
              decorator: const DotsDecorator(
                color: ColorConstants.colorDoctNotActive,
                activeColor: ColorConstants.primaryColor,
              ),
            ),
            ),
          )
        ],
      ),
    );
  }
}
