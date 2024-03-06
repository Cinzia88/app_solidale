
import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:app_solidale/screens/home/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:app_solidale/screens/servizi/offro%20aiuto/page/form_offro_aiuto.dart';
import 'package:app_solidale/screens/servizi/page/home_chiedo_aiuto.dart';
import 'package:app_solidale/service/service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';


// ignore: must_be_immutable
class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage>
    with WidgetsBindingObserver {
     
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);



     readUser().then((value) =>  editUser());

  }

Future editUser() async {
 await ReadDataUserRepository().saveToken(
  context,
  
globals.tokenFCM,);    


    print('globals.userData ${globals.userData}');
}

  Future readUser() async {
   final data =  await ReadDataUserRepository().readUser(context);
    setState(() {
      globals.userData = data;
      globals.userData!.token = globals.tokenFCM;
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("App Lifecycle State : $state");
    if (state == AppLifecycleState.resumed) {
      readUser();
    }
  }

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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                globals.userData != null
                    ? globals.userData!.verified == 0
                        ? Column(
                            children: [
                              Text(
                                'La tua email non è stata ancora verificata.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 2 * blockSizeVertical),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 Text(
                                'Per verificarla ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 2 * blockSizeVertical),
                              ),
                              GestureDetector(
                                onTap: () {
                                          Service()
                                              .verifyUser(
                                                  globals.userData!.email,
                                                  context)
                                              .then((value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar( SnackBar(
                                                    backgroundColor:
                                                        ColorConstants
                                                            .orangeGradients3,
                                                    content: Text(
                                                      'Ti abbiamo inviato un\' email di verifica',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 2 * blockSizeVertical,
                                                      ),
                                                    )));
                                          });},
                                child:  Text(
                                         'clicca qui',
                                        style:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorConstants.orangeGradients3,
                                                                                                      fontSize: 2.2 * blockSizeVertical,

                                        ),),
                              ),
                              ],)
                        
                            ],
                          )
                        : const SizedBox()
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeChiedoAiuto()));
                  },
                  child: CustomCardsCommon(
                    child: CustomContainerService(
                      serviceId: '0',
                      title: 'Chiedo Aiuto',
                      subtitle: 'Scopri i nostri principali servizi',
                      image: PathConstants.onboarding3,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OffroAiutoPage()));
                  },
                  child: CustomCardsCommon(
                    child: CustomContainerService(
                      serviceId: '1',
                      title: 'Offro Aiuto',
                      subtitle: 'Dona il tuo tempo a chi ne ha bisogno',
                      image: PathConstants.offroAiuto,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5 * blockSizeVertical,
                ),
                Text(
                  'Vuoi sostenere l\'ANF?',
                  style: TextStyle(
                      color: Colors.black, fontSize: 2 * blockSizeVertical),
                ),
                ElevatedButton(
                  onPressed: () async {
                    launchUrlString('https://www.anfam.net/come-sostenerci');
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DONA ORA',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 2 * blockSizeVertical),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
