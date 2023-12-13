import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:flutter/material.dart';


import '../../common_widgets/background_style/custom_appbar.dart';

// ignore: must_be_immutable
class SingleNewPage extends StatefulWidget {
  String title;
  String desc;
  SingleNewPage({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  State<SingleNewPage> createState() => _SingleNewPageState();
}

class _SingleNewPageState extends State<SingleNewPage> {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Scaffold(
         appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 75.0,
          automaticallyImplyLeading: true,
          flexibleSpace: customAppBar(context: context),
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: NavigationDrawerWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
               
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 2 * blockSizeVertical,
                      ),
                    ),
                  ],
                ),
              
                 Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.desc,
                    style: TextStyle(
                      fontSize: 2 * blockSizeVertical,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
