import 'package:anf_app/const/color_constants.dart';

import 'package:anf_app/screens/profilo/page/profile_page.dart';
import 'package:anf_app/screens/settings/page/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

import 'home_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    //// Use normal tab controller
    

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }
@override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
           physics: const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _motionTabBarController,
          children: const [
            HomePage(),
            ProfilePage(),
            SettingsPage(),
          ]
        ),
       bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "Home",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const [ "Home", "Profilo", "Impostazioni"],
        icons: const [ Icons.home, Icons.person_2_outlined, Icons.settings],
    
        
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        tabIconColor: Colors.white,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.white,
        tabIconSelectedColor: ColorConstants.orangeGradients3,
        tabBarColor:  ColorConstants.orangeGradients3,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
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
        icon: Icon(Icons.settings,),
        label: 'Impostazioni',
      )
    ];
  }
}
