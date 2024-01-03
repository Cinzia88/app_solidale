// ignore_for_file: must_be_immutable

import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/page/custom_card.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;import '../../../const/color_constants.dart';

class HomeChiedoAiuto extends StatefulWidget {
  @override
  State<HomeChiedoAiuto> createState() => _HomeChiedoAiutoState();
}

class _HomeChiedoAiutoState extends State<HomeChiedoAiuto> {
  ValueSharedPrefsViewSlide valueSharedPrefsViewSlide =
      ValueSharedPrefsViewSlide();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
        getValueRequest();

  }

Future getValueRequest() async {
    final value = await valueSharedPrefsViewSlide.getRequest3Complete();
    setState(() {
      globals.service3Completed = value;
    });

  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 75.0,
        automaticallyImplyLeading: true,
        flexibleSpace: customAppBar(context: context),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))
        ],
      ),
      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    'Chiedo Aiuto',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(
                    color: ColorConstants.orangeGradients3,
                  ),
                  customCardsServiceChiedoAiuto(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
