import 'package:app_solidale/screens/common_widgets/background_style/appbar_pages.dart';
import 'package:app_solidale/screens/home/page/home_page.dart';
import 'package:app_solidale/screens/profilo/page/profile_page.dart';
import 'package:app_solidale/screens/service/logout.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:app_solidale/screens/tabs/page/nessun_servizio.dart';
import 'package:app_solidale/screens/tabs/repository/read_data_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;
import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/news/page/news_page.dart';

import '../../common_widgets/loading_widget.dart';
import '../bloc/read_user_bloc.dart';

// ignore: must_be_immutable
class TabsPage extends StatefulWidget {
  
  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  PersistentTabController? _controller;
  ServiceLogout serviceLogout = ServiceLogout();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReadUserBloc>(
      create: (context) => ReadUserBloc(
        context: context,
        readDataUserRepository: context.read<ReadDataUserRepository>(),
      )..add(
          FetchUserEvent(),
        ),
      child:
          BlocConsumer<ReadUserBloc, ReadUserState>(listener: (context, state) {
        if (state is ReadUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
        return;
      }, builder: (context, state) {
        if (state is ReadUserLoadedState) {
          globals.userData = state.data;
          globals.typeRichiesta = state.data.richiesta;
          return Scaffold(
        
            body: PersistentTabView(
              context,
              controller: _controller,
              screens: [
                ProfilePage(),
              state.data.richiesta.isEmpty ? const NessunServizioPage() : HomePage(richiesta: state.data.richiesta),
                const SizedBox(),
              ],
              onItemSelected: (value) {
                if (value == 2) {
                          Navigator.of(context, rootNavigator: true).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInPage()));
                  serviceLogout.logoutUser(context);
        print('tokenlogoutTabspage ${globals.tokenValue}');
                } 
              },
              items: _navBarsItems(),
              resizeToAvoidBottomInset: true,
              navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
                  ? 0.0
                  : kBottomNavigationBarHeight,
              bottomScreenMargin: MediaQuery.of(context).viewInsets.bottom > 0
                  ? 0.0
                  : kBottomNavigationBarHeight,
              backgroundColor: ColorConstants.orangeGradients3,
              decoration:
                  const NavBarDecoration(colorBehindNavBar: Colors.transparent),
              itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
              ),
              navBarStyle: NavBarStyle
                  .style6, // Choose the nav bar style with this property
            ),
          );
        }
       return loadingWidget(context);
      }),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "Profilo",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: ColorConstants.colorDoctNotActive,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.format_list_bulleted),
          title: "Servizi",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: ColorConstants.colorDoctNotActive,
        ),
        
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.logout),
          title: "Esci",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: ColorConstants.colorDoctNotActive,
        ),
      ];
}




class PageUserTest extends StatefulWidget {
  const PageUserTest({super.key});

  @override
  State<PageUserTest> createState() => _PageUserTestState();
}

class _PageUserTestState extends State<PageUserTest> {
   PersistentTabController? _controller;
  ServiceLogout serviceLogout = ServiceLogout();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            body: PersistentTabView(
              context,
              controller: _controller,
              screens: [
<<<<<<< HEAD
                HomePage(richiesta: state.data.richiesta),
                const NewsPage(),
=======
>>>>>>> 4f0d81aba4d9a5e508e39a4ca5b0358a0c3ac6a2
                ProfilePage(),
                HomePage(richiesta: 'Chiedo Aiuto'),
                const SizedBox(),
              ],
              onItemSelected: (value) {
                if (value == 2) {
                          Navigator.of(context, rootNavigator: true).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInPage()));
                  serviceLogout.logoutUser(context);
        print('tokenlogoutTabspage ${globals.tokenValue}');
                } 
              },
              items: _navBarsItems(),
              resizeToAvoidBottomInset: true,
              navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
                  ? 0.0
                  : kBottomNavigationBarHeight,
              bottomScreenMargin: MediaQuery.of(context).viewInsets.bottom > 0
                  ? 0.0
                  : kBottomNavigationBarHeight,
              backgroundColor: ColorConstants.orangeGradients3,
              decoration:
                  const NavBarDecoration(colorBehindNavBar: Colors.transparent),
              itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
              ),
              navBarStyle: NavBarStyle
                  .style6, // Choose the nav bar style with this property
            ),
          ) ;
  }

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        
      
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "Profilo",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: ColorConstants.colorDoctNotActive,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.format_list_bulleted),
          title: "Servizi",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: ColorConstants.colorDoctNotActive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.logout),
          title: "Esci",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: ColorConstants.colorDoctNotActive,
        ),
      ];
}