import 'package:anf_app/screens/signup/page/signup_page.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_container_service.dart';

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
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUpPage()));
                },
                icon: Icon(Icons.login),
                label: Text('Accedi')),
          ),
          SizedBox(
            height: 70,
          ),
          Row(
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
         SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
              Container(
              width: MediaQuery.of(context).size.width ,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                              color: Colors.red,

              ),
            ),
            SizedBox(
              height: 20,
            ),
             Container(
              width: MediaQuery.of(context).size.width ,
              height: 150,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                              color: Colors.red,

              ),
            ),
             SizedBox(
              height: 20,
            ),
             Container(
              width: MediaQuery.of(context).size.width ,
              height: 150,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                              color: Colors.red,

              ),
            )],),
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