

import 'package:anf_app/screens/home/page/home_page.dart';
import 'package:anf_app/screens/profilo/page/profile_page.dart';
import 'package:anf_app/screens/service/logout.dart';
import 'package:anf_app/screens/signin/page/signin_page.dart';
import 'package:anf_app/screens/tabs/repository/read_data_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anf_app/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:anf_app/globals_token/globals_token.dart' as globals;
import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/screens/settings/page/settings_page.dart';
import 'package:anf_app/screens/news/news_page.dart';

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
        } return;
      }, builder: (context, state) {
        if (state is ReadUserLoadedState) {
          globals.userData = state.data;
          return Scaffold(
            body: PersistentTabView(
              context,
              controller: _controller,
              screens: [
                HomePage(richiesta: state.data.richiesta),
                const NewsPage(),
                ProfilePage(
                  
                ),
                const NewsPage(),
              ],
              onItemSelected: (value) {
    if (value == 3) {
      Navigator.of(context, rootNavigator: true).pushReplacement(                          
MaterialPageRoute(builder: (context) => SignInPage()));
      serviceLogout.logoutUser(context);
      print(globals.tokenValue);
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
          icon: const Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: ColorConstants.colorDoctNotActive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.newspaper),
          title: "News",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: ColorConstants.colorDoctNotActive,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "Profilo",
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
