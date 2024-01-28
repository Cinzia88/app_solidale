import 'dart:io';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/page/page_informativa_pdf.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:app_solidale/globals_variables/globals_variables.dart' as globals;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class IntroBancoAlimentare extends StatefulWidget {
  const IntroBancoAlimentare({super.key});

  @override
  State<IntroBancoAlimentare> createState() => _IntroBancoAlimentareState();
}

class _IntroBancoAlimentareState extends State<IntroBancoAlimentare> {


  
  @override
  Widget build(BuildContext context) {
  

    return BlocProvider<SendDataTypeServiceBloc>(
      create: (context) => SendDataTypeServiceBloc(
        context: context,
        sendDataTypeServiceRepository:
            context.read<SendDataTypeServiceRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          toolbarHeight: 75.0,
          automaticallyImplyLeading: true,
          flexibleSpace: customAppBar(context: context),
          actions: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: NavigationDrawerWidget(),
        body: BlocConsumer<SendDataTypeServiceBloc, SendDataTypeServiceState>(
            listener: (context, state) {
          if (state is SendDataTypeServiceErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } 
        }, builder: (context, state) {
          return Center(child: ContentPageBancoAlimentare()); 
        }),
      ),
    );
  }
}




class ContentPageBancoAlimentare extends StatefulWidget {
  const ContentPageBancoAlimentare({super.key});

  @override
  State<ContentPageBancoAlimentare> createState() => _ContentPageBancoAlimentareState();
}

class _ContentPageBancoAlimentareState extends State<ContentPageBancoAlimentare> {
  bool isAccepted = false;
  String? _localPath;
  bool? _permissionReady;
  TargetPlatform? platform;
  String fileurl =
      'https://appsolidale.it/storage/file_pdf/dichiarazione_sostitutiva_di_certificazione.pdf';
  String? _progress;
  final TextEditingController name = TextEditingController();
  bool? profiloIncompletoBancoAlim;
  bool? componentiIncompleti;
  bool? disabiliIncompleti;
  bool? filesIncompleti;

  var _progressList = <double>[];

  // double count = 0.0;

  double currentProgress(int index) {
    //fetch the current progress,
    //its in a list because we might want to download
    // multiple files at the same time,
    // so this makes sure the correct download progress
    // is updated.

    try {
      return _progressList[index];
    } catch (e) {
      _progressList.add(0.0);
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
  
  }

  Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;

    print(_localPath);
    final savedDir = Directory(_localPath!);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }
  
 

  

  @override
  Widget build(BuildContext context) {
      //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    final bloc = BlocProvider.of<SendDataTypeServiceBloc>(context);
    return BlocBuilder<SendDataTypeServiceBloc, SendDataTypeServiceState>(builder: (context, state) {
     
      return state is SendDataTypeServiceLoadingState
              ? loadingWidget(context)
              : SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(
                        20.0,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                'Per accedere al Servizio Banco Alimentare bastano pochi semplici passi: '),
                            const Text(
                                '\n1.  Inserisci il numero dei componenti familiari ed i loro dati (nome, data di nascita e grado di parentela)'),
                            const Text(
                                '\n2.  Dichiara se nel nucleo familiare è presente una persona diversamente abile. Se sì, indica il numero'),
                            const Text(
                                '\n3.  Procurati i documenti necessari (ISEE, documento d\'identità) e caricali sull\'app'),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: isAccepted,
                                    onChanged: (value) {
                                      setState(() {
                                        isAccepted = value!;
                                      });
                                    }),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Confermo di aver letto l\' ',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              'Informativa sul Trattamento dei Dati Personali',
                                          style: const TextStyle(
                                            color:
                                                ColorConstants.orangeGradients3,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          PageInformativaPdf()));
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: ' ',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                'Scarica la dichiarazione sostitutiva di certificazione',
                                            style: const TextStyle(
                                              color: ColorConstants
                                                  .orangeGradients3,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                _permissionReady =
                                                    await _checkPermission();
                                                if (_permissionReady!) {
                                                  await _prepareSaveDir();
                                                  print("Downloading");
                                                  try {
                                                    await Dio().download(
                                                        fileurl,
                                                        "$_localPath/dichiarazione_sostitutiva_di_certificazione.pdf",
                                                        options: Options(
                                                            headers: {
                                                              HttpHeaders
                                                                  .acceptEncodingHeader: "*"
                                                            }), // disable gzip
                                                        onReceiveProgress:
                                                            (received, total) {
                                                      if (total != -1) {
                                                        setState(() {
                                                          _progress = (received /
                                                                      total *
                                                                      100)
                                                                  .toStringAsFixed(
                                                                      0) +
                                                              "%";
                                                        });
                                                        print((received /
                                                                    total *
                                                                    100)
                                                                .toStringAsFixed(
                                                                    0) +
                                                            "%");
                                                      }
                                                    });

                                                    print(
                                                        "Download Completed.");
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                ColorConstants
                                                                    .orangeGradients3,
                                                            content:
                                                                GestureDetector(
                                                              child: Text(
                                                                'dichiarazione_sostitutiva_di_certificazione.pdf scaricato con successo',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            )));
                                                    setState(() {
                                                      _progress = '';
                                                    });
                                                  } catch (e) {
                                                    print(
                                                        "Download Failed.\n\n" +
                                                            e.toString());
                                                  }
                                                }
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _progress != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(_progress!),
                                    ],
                                  )
                                : Text(''),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: CommonStyleButton(
                                      title: 'Inizia',
                                      onTap: isAccepted
                                          ? () async {
                                              bloc.add(SendDataTypeServiceEvent(
                                                serviceId: '4',
                                                nome: globals.userData!.nome,
                                                telefono:
                                                    globals.userData!.telefono,
                                                    partenza: '',
                                                    destinazione: ''
                                              ));
                                              setState(() {
                                                profiloIncompletoBancoAlim = true;
                                                componentiIncompleti = true;
                                                disabiliIncompleti = true;
                                                filesIncompleti = true;
                                              });
                                              await ValueSharedPrefsViewSlide().setProfiloIncompletoUtenteBanco(profiloIncompletoBancoAlim!);
                                              await ValueSharedPrefsViewSlide().setProfiloIncompletoUtenteComponenti(componentiIncompleti!);
                                              await ValueSharedPrefsViewSlide().setProfiloIncompletoUtenteDisabili(disabiliIncompleti!);
                                              await ValueSharedPrefsViewSlide().setProfiloIncompletoUtenteFiles(filesIncompleti!);
                                            }
                                          : null,
                                      iconWidget: Text('')),
                                ),
                              ],
                            ),
                          ])),
                );
  });}
}