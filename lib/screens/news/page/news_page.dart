


import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../const/color_constants.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

List images = [
"https://images.wsj.net/im-867581/social",
"https://images.wsj.net/im-867681/social",
"https://images.wsj.net/im-869571/social"
];


  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return  Scaffold(
      appBar: AppBar(
           iconTheme: const IconThemeData(
            color: Colors.white,
           ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),
           
          ),
            drawer: NavigationDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                  Text(
                      'News',
                                             style: Theme.of(context).textTheme.titleSmall,

                    ),
               ],
             ),
                const Divider(
                  color: ColorConstants.orangeGradients3,
                ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF003b5b).withOpacity(0.1),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child:Column(children: [
                CachedNetworkImage(
                  imageUrl: images[0],
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                    height: 100,
                    child: CupertinoActivityIndicator(
                      color: Color(0xff003b5b),
                    ),
                  )),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 60,
                    child: Image.asset(
                      'lib/resources/images/logo.png',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Lorem Ipsum',
                      style:  TextStyle(
                        fontSize: 2 * blockSizeVertical,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style:  TextStyle(
                      fontSize: 2 * blockSizeVertical,
                    ),
                  ),
                ),
                
              ],)
                  ),
        
          Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF003b5b).withOpacity(0.1),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child:Column(children: [
                CachedNetworkImage(
                  imageUrl: images[1],
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                    height: 100,
                    child: CupertinoActivityIndicator(
                      color: Color(0xff003b5b),
                    ),
                  )),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 60,
                    child: Image.asset(
                      'lib/resources/images/logo.png',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Lorem Ipsum',
                      style:  TextStyle(
                        fontSize: 2 * blockSizeVertical,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style:  TextStyle(
                      fontSize: 2 * blockSizeVertical,
                    ),
                  ),
                ),
                
              ],)
                ),
    
          Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF003b5b).withOpacity(0.1),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child:Column(children: [
                CachedNetworkImage(
                  imageUrl: images[2],
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                    height: 100,
                    child: CupertinoActivityIndicator(
                      color: Color(0xff003b5b),
                    ),
                  )),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 60,
                    child: Image.asset(
                      'lib/resources/images/logo.png',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Lorem Ipsum',
                      style:  TextStyle(
                        fontSize: 2 * blockSizeVertical,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style:  TextStyle(
                      fontSize: 2 * blockSizeVertical,
                    ),
                  ),
                ),
                
              ],)
                )
        ],
        ),
      ),
    );
  }
}