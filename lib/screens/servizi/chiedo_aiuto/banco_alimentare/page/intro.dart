import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/form_data_parents/carica_parenti_page.dart';
import 'package:flutter/material.dart';

class IntroBancoAlimentare extends StatefulWidget {
  const IntroBancoAlimentare({super.key});

  @override
  State<IntroBancoAlimentare> createState() => _IntroBancoAlimentareState();
}

class _IntroBancoAlimentareState extends State<IntroBancoAlimentare> {
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 75.0,
        automaticallyImplyLeading: true,
        flexibleSpace: customAppBar(context: context),
      ),
      drawer: NavigationDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Image.asset(
                          PathConstants.bancoAlim,
                        ),
                      ),
                      SizedBox(
                        height: 3 * blockSizeVertical,
                      ),
                      Text(
                        'Banco Alimentare',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Per accedere al Servizio Banco Alimentare, dovrai procurarti i seguenti documenti: '),
              Text(
                  '\n1.  Modello ISEE, per valutare e confrontare la situazione economica del nucleo familiare'),
              Text('\n2.  Documento d\' identità'),
            ])),
      ),
      floatingActionButton: CommonStyleButton(
          title: 'Inizia',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ParentsPage(),
                ));
          },
          iconWidget: Text('')),
    );
  }
}
