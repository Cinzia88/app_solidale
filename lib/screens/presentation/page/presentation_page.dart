import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/signin/page/signin_page.dart';
import 'package:anf_app/screens/signup/page/signup_page.dart';
import 'package:flutter/material.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
      Container(
        height: size.height * .43,
        decoration: BoxDecoration(color: Color(0xFFF5CEB8)),
      ),
      SafeArea(
          child: Column(
                children: [
          Padding(
            padding: const EdgeInsets.only(top:20.0, right: 20.0),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignInPage()));
                  },
                  icon: Icon(Icons.login),
                  label: Text('Accedi')),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'ANF',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(PathConstants.onboarding5),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(30), //border corner radius
          
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), //color of shadow
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(PathConstants.onboarding1),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(30), //border corner radius
          
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), //color of shadow
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(PathConstants.onboarding2),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(30), //border corner radius
          
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), //color of shadow
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
                ],
              ))
    ]));
  }
}


/*  Column(
        children: [
          CustomContainerService(),
                  CustomContainerService(),
          CustomContainerService(),
    
        ],
      ), */