// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:io';

import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/const/text_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/home/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/model/list_messages_model.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/bloc/read_request_bloc.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/edit_acc_onc/page_edit_acc.onc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/page_acc_onc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/edit_banco_alim/edit_banco_alim.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/page/intro.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/page/taxi_solidale.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/widget/edit_taxi_solidale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../const/color_constants.dart';
import 'package:http/http.dart' as http;
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class HomeChiedoAiuto extends StatefulWidget {
  @override
  State<HomeChiedoAiuto> createState() => _HomeChiedoAiutoState();
}

class _HomeChiedoAiutoState extends State<HomeChiedoAiuto> {
 List<String> serviceId = [];


 @override




  @override
  Widget build(BuildContext context) {
    showAlertDialog(
        {required dynamic Function()? onPressed,
        required String title,
        required String desc}) {
      return showDialog(
        barrierColor: Colors.black87,
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: ColorConstants.orangeGradients3,
                    ))
              ],
            ),
            content: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      desc,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocProvider<ReadRequestBloc>(
      create: (context) => ReadRequestBloc(
        context: context,
        editDataTypeServiceRepository:
            context.read<EditDataTypeServiceRepository>(),
      )..add(FetchRequestEvent()),
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
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ))
            ],
          ),
          drawer: NavigationDrawerWidget(),
          body:  BlocConsumer<ReadRequestBloc, ReadRequestState>(
            listener: (context, state) {
          if (state is ReadRequestErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          } else if (state is ReadRequestLoadedState) {

            for (int i = 0; i < state.data.length; i++) {
              setState(() {
                serviceId.add(state.data[i].serviceId);
              });
            }
            
          }
        }, builder: (context, state) {
              return  state is ReadRequestLoadingState
              ? loadingWidget(context)
              : SingleChildScrollView(
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
                                
                                serviceId.contains('2') 
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 40.0),
                                        child: CustomCardsCommon(
                                          child: CustomContainerService(
                                            title: 'Taxi Solidale',
                                            subtitle:
                                                'Ti aiutiamo a raggiungere strutture e servizi primari in città',
                                            image: PathConstants.taxiSolidale,
                                            widget: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 15.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    TaxiSolidaleEditPage()));
                                                      },
                                                      child: Text(
                                                        'Modifica',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                blockSizeVertical *
                                                                    2),
                                                      )),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showAlertDialog(
                                                          title: TextConstants
                                                              .infoAlertTitleTaxiSolidale,
                                                          desc: TextConstants
                                                              .infoAlertTaxiSolidale,
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        const TaxiSolidalePage()));
                                                          });
                                                    },
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Image.asset(
                                                          PathConstants.infoService),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 40.0),
                                        child: CustomCardsCommon(
                                          child: CustomContainerService(
                                            title: 'Taxi Solidale',
                                            subtitle:
                                                'Ti aiutiamo a raggiungere strutture e servizi primari in città',
                                            image: PathConstants.taxiSolidale,
                                            widget: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 15.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    const TaxiSolidalePage()));
                                                      },
                                                      child: Text(
                                                        'Richiedi',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                blockSizeVertical *
                                                                    2),
                                                      )),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showAlertDialog(
                                                          title: TextConstants
                                                              .infoAlertTitleTaxiSolidale,
                                                          desc: TextConstants
                                                              .infoAlertTaxiSolidale,
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        const TaxiSolidalePage()));
                                                          });
                                                    },
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Image.asset(
                                                          PathConstants.infoService),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  serviceId.contains('3') 
                                    
                                    ? Padding(
                                        padding: const EdgeInsets.only(bottom: 40.0),
                                        child: CustomCardsCommon(
                                          child: CustomContainerService(
                                            title: 'Accompagnamento Oncologico',
                                            subtitle:
                                                'Ti supportiamo per ricevere le cure necessarie',
                                            image: PathConstants.accompagnamOncolog,
                                            widget: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 15.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    AccompagnamentoOncologicoEditPage()));
                                                      },
                                                      child: Text(
                                                        'Modifica',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                blockSizeVertical *
                                                                    2),
                                                      )),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showAlertDialog(
                                                        title: TextConstants
                                                            .infoAlertTitleAccompagnOncol,
                                                        desc: TextConstants
                                                            .infoAlertAccompagnOncol,
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      AccompagnamentoOncologicoPage()));
                                                        },
                                                      );
                                                    },
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Image.asset(
                                                          PathConstants.infoService),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(bottom: 40.0),
                                        child: CustomCardsCommon(
                                          child: CustomContainerService(
                                            title: 'Accompagnamento Oncologico',
                                            subtitle:
                                                'Ti supportiamo per ricevere le cure necessarie',
                                            image: PathConstants.accompagnamOncolog,
                                            widget: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 15.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    AccompagnamentoOncologicoPage()));
                                                      },
                                                      child: Text(
                                                        'Richiedi',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                blockSizeVertical *
                                                                    2),
                                                      )),
                                                  GestureDetector(
                                                    onTap: () {
                                                      showAlertDialog(
                                                        title: TextConstants
                                                            .infoAlertTitleAccompagnOncol,
                                                        desc: TextConstants
                                                            .infoAlertAccompagnOncol,
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      AccompagnamentoOncologicoPage()));
                                                        },
                                                      );
                                                    },
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Image.asset(
                                                          PathConstants.infoService),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                 serviceId.contains('4') 
                                    
                                    ? CustomCardsCommon(
                                        child: CustomContainerService(
                                          title: 'Banco Alimentare',
                                          subtitle:
                                              'Prenota o conferma il ritiro del tuo pacco alimentare',
                                          image: PathConstants.bancoAlim,
                                          widget: Padding(
                                            padding: const EdgeInsets.only(top: 15.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  IntroBancoAlimentareEdit()));
                                                    },
                                                    child: Text(
                                                      'Modifica',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize:
                                                              blockSizeVertical * 2),
                                                    )),
                                                GestureDetector(
                                                  onTap: () {
                                                    showAlertDialog(
                                                      title: TextConstants
                                                          .infoAlertTitleBancoAlim,
                                                      desc: TextConstants
                                                          .infoAlertBancoAlim,
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    IntroBancoAlimentare()));
                                                      },
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: Image.asset(
                                                        PathConstants.infoService),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : CustomCardsCommon(
                                        child: CustomContainerService(
                                          title: 'Banco Alimentare',
                                          subtitle:
                                              'Prenota o conferma il ritiro del tuo pacco alimentare',
                                          image: PathConstants.bancoAlim,
                                          widget: Padding(
                                            padding: const EdgeInsets.only(top: 15.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  IntroBancoAlimentare()));
                                                    },
                                                    child: Text(
                                                      'Richiedi',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize:
                                                              blockSizeVertical * 2),
                                                    )),
                                                GestureDetector(
                                                  onTap: () {
                                                    showAlertDialog(
                                                      title: TextConstants
                                                          .infoAlertTitleBancoAlim,
                                                      desc: TextConstants
                                                          .infoAlertBancoAlim,
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    IntroBancoAlimentare()));
                                                      },
                                                    );
                                                  },
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: Image.asset(
                                                        PathConstants.infoService),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
            }
          )),
    );
  }
}
