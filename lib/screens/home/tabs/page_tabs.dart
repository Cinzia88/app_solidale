import 'package:anf_app/const/color_constants.dart';

import 'package:anf_app/screens/profilo/page/profile_page.dart';
import 'package:anf_app/screens/settings/page/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:motion_tab_bar_v2/motion-tab-bar.dart';


import '../../../const/path_constants.dart';
import '../../common_widgets/background_style/custom_appbar.dart';
import '../../news/news_page.dart';
import '../page/home_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;


 void _onItemTapped(int index) {
  
    setState(() {
      _selectedIndex = index;
    });
  }
 List pages = const [
              HomePage(),
              NewsPage(),
              ProfilePage(),
              SettingsPage(),
            ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                ColorConstants.orangeGradients1,
                ColorConstants.orangeGradients2,
                ColorConstants.orangeGradients3,
              ],
              begin: Alignment.topLeft,
              end: Alignment.center,
            )),
            child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    Padding(
                      padding:
                          const EdgeInsets.only( top: 20.0, bottom: 20.0),
                      child: Row(
                        children: [
                          Image.asset(
                           PathConstants.logoanfcompletoorizz,
                            width: 200,
                          ),
                         
                        ],
                      ),
                    ),
                   
                  ],
                ),
             
          )
        ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
        items: buildBottomNavBarItems(),
        backgroundColor: ColorConstants.orangeGradients3,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: ColorConstants.colorDoctNotActive,
      onTap: _onItemTapped,)
      
    );
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return const[
      BottomNavigationBarItem(
        label: 'Home',
        icon:  Icon(Icons.home, ),
      ),
       BottomNavigationBarItem(
        label: 'News',
        icon:  Icon(Icons.newspaper, ),
      ),
      BottomNavigationBarItem(
        label: 'Profilo',
        icon:  Icon(Icons.person,),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.logout,
        ),
        label: 'Esci',
      )
    ];
  }
}
