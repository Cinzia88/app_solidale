import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/signin/page/signin_page.dart';
import 'package:anf_app/screens/signup/page/signup_page.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';
import '../../../const/text_constants.dart';
import '../../signup/widget/already_account.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.5, right: 20, left: 20),
      child: Column(
        children: [
          Stack(
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
                              Text('Offro Aiuto',
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
              Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    PathConstants.login,
                    width: MediaQuery.of(context).size.width / 2.5,
                  ))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
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
                                Text('Chiedo Aiuto',
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
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  TextConstants.alreadyHaveAccount,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignInPage()));
                  },
                  label: const Text('Accedi'),
                  icon: const Icon(Icons.person_add_alt),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      primary: ColorConstants.primaryColor,
                      onPrimary: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Vuoi sostenere l\'ANF?',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SignInPage()));
                  },
                  label: const Text('Dona Ora'),
                  icon: const Icon(Icons.payment),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      primary: ColorConstants.primaryColor,
                      onPrimary: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
