import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/bloc/send_data_type_service_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class IntroBancoAlimentare extends StatefulWidget {
  const IntroBancoAlimentare({super.key});

  @override
  State<IntroBancoAlimentare> createState() => _IntroBancoAlimentareState();
}

class _IntroBancoAlimentareState extends State<IntroBancoAlimentare> {
  bool isAccepted = false;
    final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
 
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;

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
          return SfPdfViewer.asset(
        'assets/files/pdf_privacy/All.16-Informativasultrattamentodeidatipersonali-daAFFIGGEREOPT.pdf',
        key: _pdfViewerKey,
      );SingleChildScrollView(
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
                                style: Theme.of(context).textTheme.titleSmall,
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
                      activeColor: ColorConstants.orangeGradients3,
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
                                color: ColorConstants.orangeGradients3,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                SfPdfViewer.asset(
        'assets/files/pdf_privacy/All.16 - Informativa sul trattamento dei dati personali - da AFFIGGERE OPT.pdf',
        key: _pdfViewerKey,
      );
                                },
                            ),
                          ],
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                                SfPdfViewer.asset(
        'assets/files/pdf_privacy/All.16 - Informativa sul trattamento dei dati personali - da AFFIGGERE OPT.pdf',
        key: _pdfViewerKey,
      );
                                },),
                    ),
                  ),
                ],
              ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                   
                       Padding(
                         padding: const EdgeInsets.only(top: 30.0),
                         child: CommonStyleButton(
                                title: 'Inizia',
                                onTap: isAccepted  ?() {
                                     SendDataTypeServiceRepository()
                                      .sendDataTypeservice(
                                          context,
                                          '4',
                                          globals.userData!.nome,
                                          globals.userData!.telefono);
                                } : null,
                                iconWidget: Text('')),
                       ),
                        ],
                      )
                    ])),
          );
        }),
      ),
    );
  }
}
