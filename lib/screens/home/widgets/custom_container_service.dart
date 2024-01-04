import 'package:flutter/material.dart';


class CustomContainerService extends StatelessWidget {
  final String? serviceId;
  final String title;
  final String subtitle;
  final String image;
  final Widget? widget;

  const CustomContainerService({
    Key? key,
     this.serviceId,
    required this.title,
    required this.subtitle,
    required this.image,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                title,
               style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
           
          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 2 * blockSizeVertical,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 70,
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
              ],
            ),
              widget == null ? SizedBox() : widget!
      ],
    );
  }
}
