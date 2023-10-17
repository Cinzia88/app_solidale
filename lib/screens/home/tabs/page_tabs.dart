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
 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
            physics:
                const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
            children: const [
              HomePage(),
              ProfilePage(),
              SettingsPage(),
            ]),
        bottomNavigationBar: BottomNavigationBar(items: buildBottomNavBarItems(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,)
        
      ),
      
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
