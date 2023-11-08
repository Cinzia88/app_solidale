  import 'package:app_solidale/const/path_constants.dart';
import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';
import '../../common_widgets/custom_cards_common.dart';


class OffroAiutoView extends StatefulWidget {
  const OffroAiutoView({super.key});

  @override
  State<OffroAiutoView> createState() => _OffroAiutoViewState();
}

class _OffroAiutoViewState extends State<OffroAiutoView> {
  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return   Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: CustomCardsCommon(
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
                                                  fontSize: 3 * blockSizeVertical,
                                                  color: ColorConstants.titleText,
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
                              Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  width: 70,
                                  child: Image.asset(
                                    PathConstants.onboarding4,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
  }
}