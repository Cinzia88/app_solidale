import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/signup/page/signup_page.dart';

import 'package:flutter/material.dart';


class CustomCardsAuth extends StatelessWidget {
  const CustomCardsAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.5, right: 20, left: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignUpPage(),
                ),
              );
            },
            child: Stack(
              children: [
                Material(
                  elevation: 10,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30))),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Crea il Tuo Account',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Color(0xFFEF6E31))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                        'Crea il tuo Account per offrire un tuo servizio ad ANF Famiglie')),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignUpPage(),
                ),
              );
            },
            child: Stack(
              children: [
                Material(
                  elevation: 10,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30))),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Accedi',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Color(0xFFEF6E31))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 150,
                                    child: Text(
                                        'Crea il tuo Account per usufruire dei servizi di ANF Famiglie')),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      PathConstants.login,
                      width: MediaQuery.of(context).size.width / 2.5,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Material(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(30))),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Dona Ora',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Color(0xFFEF6E31))),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Text(
                                      'Crea il tuo Account per usufruire dei servizi di ANF Famiglie')),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    PathConstants.login,
                    width: MediaQuery.of(context).size.width / 2.5,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
