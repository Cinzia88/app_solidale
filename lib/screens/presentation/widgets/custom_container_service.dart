



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
                                
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: ColorConstants.titleText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                                subtitle),
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
