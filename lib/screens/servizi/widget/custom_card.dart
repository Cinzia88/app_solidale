import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/text_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/info/page/info_page.dart';
import 'package:app_solidale/screens/home/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/servizi/page_service/page_service.dart';
import 'package:flutter/material.dart';
import '../../../../const/path_constants.dart';

Widget customCardsServiceChiedoAiuto(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FormServizio(
                          image: PathConstants.taxiSolidale,
                          title: 'Servizio: Taxi Solidale',
                        )));
          },
          child: CustomCardsCommon(
            child: CustomContainerService(
              title: 'Taxi Solidale',
              subtitle:
                  'Ti aiutiamo a raggiungere strutture e servizi primari in città',
              image: PathConstants.taxiSolidale,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: CommonStyleButton(
                        title: 'Info',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      TextConstants.infoAlertTitleTaxiSolidale,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              ColorConstants.orangeGradients3,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color:
                                              ColorConstants.orangeGradients3,
                                        ))
                                  ],
                                ),
                                content: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(32.0)),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text(
                                          TextConstants.infoAlertTaxiSolidale,
                                          textAlign: TextAlign.justify,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const FormServizio(
                                                                image: PathConstants
                                                                    .taxiSolidale,
                                                                title:
                                                                    TextConstants.infoAlertTitleTaxiSolidale,
                                                              )));
                                                },
                                                icon: const Icon(
                                                    Icons.taxi_alert),
                                                label: const Text('Richiedi'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        iconWidget: Icon(Icons.info)),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        CustomCardsCommon(
          child: CustomContainerService(
            title: 'Accompagnamento Oncologico',
            subtitle: 'Ti supportiamo per ricevere le cure necessarie',
            image: PathConstants.accompagnamOncolog,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: CommonStyleButton(
                      title: 'Info',
                      onTap: () {
                         showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      TextConstants.infoAlertTitleAccompagnOncol,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              ColorConstants.orangeGradients3,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color:
                                              ColorConstants.orangeGradients3,
                                        ))
                                  ],
                                ),
                                content: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(32.0)),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text(
                                          TextConstants.infoAlertAccompagnOncol,
                                          textAlign: TextAlign.justify,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const FormServizio(
                                                                image: PathConstants
                                                                    .taxiSolidale,
                                                                title:
                                                                   TextConstants.infoAlertTitleAccompagnOncol,
                                                              )));
                                                },
                                                icon: const Icon(
                                                    Icons.taxi_alert),
                                                label: const Text('Richiedi'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                       
                      },
                      iconWidget: Icon(Icons.info)),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        CustomCardsCommon(
          child: CustomContainerService(
            title: 'Banco Alimentare',
            subtitle: 'Prenota o conferma il ritiro del tuo pacco alimentare',
            image: PathConstants.bancoAlim,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: CommonStyleButton(
                      title: 'Info',
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      TextConstants.infoAlertTitleBancoAlim,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              ColorConstants.orangeGradients3,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color:
                                              ColorConstants.orangeGradients3,
                                        ))
                                  ],
                                ),
                                content: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(32.0)),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text(
                                          TextConstants.infoAlertBancoAlim,
                                          textAlign: TextAlign.justify,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const FormServizio(
                                                                image: PathConstants
                                                                    .taxiSolidale,
                                                                title:
                                      TextConstants.infoAlertTitleBancoAlim,
                                                              )));
                                                },
                                                icon: const Icon(
                                                    Icons.taxi_alert),
                                                label: const Text('Richiedi'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        
                      },
                      iconWidget: Icon(Icons.info)),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
