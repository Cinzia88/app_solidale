import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:flutter/material.dart';

class OffroAiutoPage extends StatefulWidget {
  const OffroAiutoPage({super.key});

  @override
  State<OffroAiutoPage> createState() => _OffroAiutoPageState();
}

class _OffroAiutoPageState extends State<OffroAiutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 75.0,
        automaticallyImplyLeading: false,
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
                    'Offro Aiuto',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Divider(
                    color: ColorConstants.orangeGradients3,
                  ),
                  Text(
                      'Desideri donare il tuo tempo e particolare attenzione a chi ha più bisogno?'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'SEI IL BENVENUTO!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Puoi partecipare come volontario a tante iniziative di solidarietà attivate presso la nostra associazione. \nSarai contattato per fissare un colloquio'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
