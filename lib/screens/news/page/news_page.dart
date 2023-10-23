


import 'package:anf_app/screens/news/page/single_new_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../const/color_constants.dart';
import '../../common_widgets/background_style/appbar_pages.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: appBarPages(context),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Text(
                      'News',
                      style: TextStyle(
                          color: ColorConstants.titleText,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
               ],
             ),
                const Divider(
                  color: ColorConstants.orangeGradients3,
                ),
            GestureDetector(
              onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: SingleNewPage(),
              withNavBar: true,
            );
              },
              child: Container(
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
                    imageUrl: "https://images.wsj.net/im-867581/social",
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
                        style: const TextStyle(
                          fontSize: 15,
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
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  
                ],)
                    ),
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
                  imageUrl: "https://images.wsj.net/im-867681/social",
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
                      style: const TextStyle(
                        fontSize: 15,
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
                    style: const TextStyle(
                      fontSize: 13,
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
                  imageUrl: "https://images.wsj.net/im-869571/social",
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
                      style: const TextStyle(
                        fontSize: 15,
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
                    style: const TextStyle(
                      fontSize: 13,
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