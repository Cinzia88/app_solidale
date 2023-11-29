import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/menu/area_personale/profilo_page.dart';
import 'package:app_solidale/screens/menu/logout/logout.dart';
import 'package:app_solidale/screens/news/page/news_page.dart';
import 'package:app_solidale/screens/servizi/page/home_chiedo_aiuto.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
    ServiceLogout serviceLogout = ServiceLogout();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstants.orangeGradients3,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    PathConstants.logoanfcompletovertic,
                  ),
                ),
              ],
            ),
            
        
          ),
           ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PresentationPage()));
              }),
               ListTile(
              leading: Icon(
                Icons.newspaper,
                color: Colors.white,
              ),
              title: Text(
                'News',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsPage()));
              }),
          ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              title: Text(
                'Il Mio Account',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              }),
         
          ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                'Esci',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                 Navigator.of(context, rootNavigator: true).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInPage()));
                  serviceLogout.logoutUser(context);
              }),
              Divider(color: ColorConstants.colorDoctNotActive,),
               ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: Text(
                'Chiedo Aiuto',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeChiedoAiuto()));
              }),
               ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: Text(
                'Offro Aiuto',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeChiedoAiuto()));
              }),
          const SizedBox(
            height: 50,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
