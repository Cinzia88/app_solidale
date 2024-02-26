import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/home/page/presentation_page.dart';
import 'package:app_solidale/screens/menu/area_personale/profilo_page.dart';
import 'package:app_solidale/screens/menu/logout/logout.dart';
import 'package:app_solidale/screens/menu/messages/page.dart';
import 'package:app_solidale/screens/news/page/news_page.dart';
import 'package:app_solidale/screens/servizi/offro%20aiuto/page/form_offro_aiuto.dart';
import 'package:app_solidale/screens/servizi/page/home_chiedo_aiuto.dart';
import 'package:app_solidale/screens/signin/page/signin_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Drawer(
      backgroundColor: ColorConstants.orangeGradients3,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    height: 100,
                    child: Image.asset(
                      PathConstants.logoanfcompletovertic,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
                size: 3.5 * blockSizeVertical,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.5 * blockSizeVertical,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PresentationPage()));
              }),
               
          ListTile(
              leading: Icon(
                Icons.newspaper,
                color: Colors.white,
                size: 3.5 * blockSizeVertical,
              ),
              title: Text(
                'News',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.5 * blockSizeVertical,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsPage()));
              }),
               ListTile(
              leading: Icon(
                Icons.message,
                color: Colors.white,
                size: 3.5 * blockSizeVertical,
              ),
              title: Text(
                'Messaggi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.5 * blockSizeVertical,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MessagesPage()));
              }), 
          ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 3.5 * blockSizeVertical,
              ),
              title: Text(
                'Il Mio Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.5 * blockSizeVertical,
                ),
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
                size: 3.5 * blockSizeVertical,
              ),
              title: Text(
                'Esci',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.5 * blockSizeVertical,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context, rootNavigator: true).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignInPage()));
                serviceLogout.logoutUser(context);

              }),
          Divider(
            color: const Color.fromARGB(255, 29, 21, 18),
          ),
          ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 3.5 * blockSizeVertical,
              ),
              title: Text(
                'Chiedo Aiuto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.5 * blockSizeVertical,
                ),
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
                size: 3.5 * blockSizeVertical,
              ),
              title: Text(
                'Offro Aiuto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 2.5 * blockSizeVertical,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OffroAiutoPage()));
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
