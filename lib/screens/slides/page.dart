import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/data_constants.dart';
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
         _curr == 4 ? SizedBox():   Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "",
                      children: [
                        TextSpan(
                          text: " Salta",
                          style:  TextStyle(
                            color: ColorConstants.titleText,
                            fontSize: 2.5 * blockSizeVertical,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              setState(() {
                                viewSlide = false;
                              });
                           
                              await valueSharedPrefsViewSlide
                                  .setValueViewSlide(viewSlide);
                            },
                        ),
                      ],
                    ),
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
          
        ],
      ),
    );
  }
}
