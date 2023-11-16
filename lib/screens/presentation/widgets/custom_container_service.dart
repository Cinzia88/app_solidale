



import 'package:flutter/material.dart';


import '../../../const/color_constants.dart';

class CustomContainerService extends StatelessWidget {
 final String title;
 final String subtitle;
 final String image;


  const CustomContainerService({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return  Row(
                    children: [
                       Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    title,
                                    style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2.5 * blockSizeVertical,
                                      color: ColorConstants.titleText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                                subtitle, style:  TextStyle(
                                      fontSize: 2.0 * blockSizeVertical,
                                    ),),
                          ],
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          width: 70,
                          child: Image.asset(
                            image,
                          ),
                        ),
                      )
                    ],
                  );
  }
}
