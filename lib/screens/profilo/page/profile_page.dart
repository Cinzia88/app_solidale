import 'package:anf_app/screens/common_widgets/custom_button.dart';
import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';

import 'package:anf_app/screens/profilo/page/dati_da_inserire/dati_anagrafici_form.dart';

import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';
import '../page/modifica_dati.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(20.0),

      child: Column(
        children: [
          const Text(
                'Area Personale',
                style: TextStyle(
                    color: ColorConstants.titleText,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const Divider(
                color: ColorConstants.orangeGradients3,
              ),
              SizedBox(
                height: 30,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                    "Il Tuo Profilo è Completo al 50%",
                    style: TextStyle(
                        color: ColorConstants.titleText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FormProfilePage()));
                  },
                  child: CustomCardsCommon(
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              color: ColorConstants.orangeGradients3,
                            ),
                            Text('  Dati Anagrafici',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorConstants.orangeGradients3,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Completa il tuo profilo con i tuoi dati anagrafici',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditFormProfilePage()));
                  },
                  child: CustomCardsCommon(
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.edit,
                              color: ColorConstants.orangeGradients3,
                            ),
                            Text('  Modifica Il Tuo Profilo',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorConstants.orangeGradients3,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Modifica i tuoi dati e visualizza la lista dei documenti caricati',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonStyleButton(title: 'Esci', onTap: (){}, iconWidget: Icon(Icons.logout))
        ],
      ),
    );
  }
}
