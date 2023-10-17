import 'package:anf_app/const/color_constants.dart';

import 'package:anf_app/screens/profilo/page/profile_page.dart';
import 'package:anf_app/screens/settings/page/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:motion_tab_bar_v2/motion-tab-bar.dart';


import '../page/home_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
    final ScrollController _homeController = ScrollController();


 void _onItemTapped(int index) {
  
    setState(() {
      _selectedIndex = index;
    });
  }
 List pages =  [
              HomePage(),
              ProfilePage(),
              SettingsPage(),
            ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: buildBottomNavBarItems(),
        backgroundColor: ColorConstants.orangeGradients3,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: ColorConstants.colorDoctNotActive,
      onTap: _onItemTapped,)
      
    );
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        label: 'Home',
        icon: new Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: 'Notifiche',
        icon: new Icon(Icons.notifications),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'Impostazioni',
      )
    ];
  }
}
