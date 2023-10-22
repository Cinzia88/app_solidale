import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../const/color_constants.dart';
import '../../common_widgets/background_style/appbar_pages.dart';
import '../../tabs/model/get_user_model.dart';
import '../page/modifica_dati.dart';
import 'dati_da_inserire/dati_anagrafici_form.dart';

class ProfilePage extends StatefulWidget {
 
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: appBarPages(context),),
      body: SingleChildScrollView(
        child: Padding(
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
              
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                       PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: FormProfilePage(),
              withNavBar: true,
            );
                      
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
                       PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: EditFormProfilePage(),
              withNavBar: true,
            );
                     
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
                  const SizedBox(
                    height: 40,
                  ),
                       GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: EditFormProfilePage(),
              withNavBar: true,
            );
                      
                    },
                    child: CustomCardsCommon(
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.password,
                                color: ColorConstants.orangeGradients3,
                              ),
                              Text('  Cambio Password',
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
                                  'Cambia la tua password attuale ed inserisci quella destinata a sostituirla. ',
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
                  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                                'Elimina Account',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: ColorConstants.titleText),
                              ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
                      Slidable(
                    startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                       
                          SlidableAction(
                            onPressed: (context) {
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              color: Colors.grey[400]!),
                        ],
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Text(
                               'Scorri per rimuovere account',
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: ColorConstants.orangeGradients3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),),
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
