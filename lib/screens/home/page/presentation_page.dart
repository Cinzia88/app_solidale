import 'dart:convert';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:app_solidale/screens/home/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/offro%20aiuto/page/form_offro_aiuto.dart';
import 'package:app_solidale/screens/servizi/page/home_chiedo_aiuto.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:app_solidale/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;


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
    getValueProfiloTaxiCompleto();
        getValueProfiloAccOncCompleto();
getValueProfiloBancoCompleto();
  getValueProfiloComponentiCompleto();
    getValueProfiloDisabiliBanco();
    getValueProfiloFilesCompleto();



      getValueProfiloDestinazioneCompleto();
    getValueProfiloDisabiliTaxi();
    getValueProfiloFilesTaxiCompleto();
    readUser().then((value) => getRequestUser());

  }




  Future getValueProfiloFilesTaxiCompleto() async {
    final value =
        await ValueSharedPrefsViewSlide().getsetProfiloIncompletoUtenteFilesTaxi().then((value) {
          ValueSharedPrefsViewSlide().removeProfiloIncompletoUtenteFilesTaxi();
        });
    setState(() {
      globals.filesTaxiIncompleti = value;
    });

    print('files ${globals.filesTaxiIncompleti}');
  }



 Future getValueProfiloDestinazioneCompleto() async {
    final value = await ValueSharedPrefsViewSlide()
        .getProfiloIncompletoUtenteDestinazioneTaxi().then((value) {
          ValueSharedPrefsViewSlide().removeProfiloIncompletoUtenteDestinazioneTaxi();
        });
    setState(() {
      globals.destinazioneTaxiIncompleta = value;
    });

    print('componenti ${globals.destinazioneTaxiIncompleta}');
  }

  Future getValueProfiloDisabiliTaxi() async {
    final value =
        await ValueSharedPrefsViewSlide().getProfiloIncompletoUtenteDisabili().then((value) {
          ValueSharedPrefsViewSlide().removeProfiloIncompletoUtenteDisabili();
        });
    setState(() {
      globals.disabiliIncompleti = value;
    });

    print('disabili ${globals.disabiliIncompleti}');
  }

















Future getValueProfiloTaxiCompleto() async {
    final value = await ValueSharedPrefsViewSlide().getProfiloIncompletoUtenteTaxi().then((value) {
          ValueSharedPrefsViewSlide().removeProfiloIncompletoUtenteTaxi();
        });
setState(() {
  globals.profiloIncompletoTaxi = value;
});

print('profiloIncompletoTaxi ${globals.profiloIncompletoTaxi}');
  }

  Future getValueProfiloAccOncCompleto() async {
    final value = await ValueSharedPrefsViewSlide().getProfiloIncompletoUtenteAccOnc();
setState(() {
  globals.profiloIncompletoAccOnc = value;
});

print('profiloIncompletoAccOnc ${globals.profiloIncompletoAccOnc}');
  }

   Future getValueProfiloBancoCompleto() async {
    final value = await ValueSharedPrefsViewSlide().getProfiloIncompletoUtenteBanco().then((value) {
          ValueSharedPrefsViewSlide().removeProfiloIncompletoUtenteBanco();
        });;
setState(() {
  globals.profiloIncompletoBancoAlim = value;
});

print('profiloIncompletoBanco ${globals.profiloIncompletoBancoAlim}');
  }

 



  Future getValueProfiloComponentiCompleto() async {
    final value = await ValueSharedPrefsViewSlide()
        .getProfiloIncompletoUtenteComponenti();
    setState(() {
      globals.componentiIncompleti = value;
    });

    print('compo ${globals.componentiIncompleti}');
  }

  Future getValueProfiloDisabiliBanco() async {
    final value =
        await ValueSharedPrefsViewSlide().getProfiloIncompletoUtenteDisabili();
    setState(() {
      globals.disabiliIncompleti = value;
    });

    print('disabili ${globals.disabiliIncompleti}');
  }

  Future getValueProfiloFilesCompleto() async {
    final value =
        await ValueSharedPrefsViewSlide().getProfiloIncompletoUtenteFiles();
    setState(() {
      globals.filesIncompleti = value;
    });

    print('files ${globals.filesIncompleti}');
  }

  
Future<List<RequestData>> getRequestUser() async {
    var url =
        '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/richiesta/show/${globals.userData!.id}';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${globals.tokenValue}'
      },
    );
    final List<dynamic> body = json.decode(response.body);
    var data = body.map((e) => RequestData.fromJson(e)).toList();
    setState(() {
      globals.listRequestData = data;
    });
    print('reqdata ${globals.listRequestData}');
    switch (response.statusCode) {
      case 200:
        print('success data request');
      case 401:
        Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => PresentationPage()));

        break;
      case 400:
        String message = 'Utente non trovato';
        Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => PresentationPage()));
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )));
        break;
      case 500:
        String message = 'Errore Server: impossibile stabilire una connessione';
        Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(builder: (context) => PresentationPage()));
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )));
        break;
      default:
        print('errore generico');
    }
    return data;
  }



  Future readUser() async {
    var data = await ReadDataUserRepository().readUser(context);
    setState(() {
      globals.userData = data;
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
