import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_cards.dart';

// ignore: must_be_immutable
class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {


@override
  void initState() {
    super.initState();
    ReadDataUserRepository().readUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
             appBar: AppBar(
           iconTheme: const IconThemeData(
            color: Colors.white,
           ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),
          ),
          drawer: NavigationDrawerWidget(),
            body: Center(
              child: SingleChildScrollView(
                child: CustomCard(),
              ),
            ),
          );
        }
}
