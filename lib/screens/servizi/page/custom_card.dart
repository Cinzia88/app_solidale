import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/text_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/home/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/page/banco_alimentare_page.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/page/intro.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/page/taxi_solidale.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/page_acc_onc.dart';
import 'package:flutter/material.dart';
import '../../../../const/path_constants.dart';

Widget customCardsServiceChiedoAiuto(BuildContext context) {
  showAlertDialog(
      {required dynamic Function()? onPressed,
      required String title,
      required String desc}) {
    return showDialog(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ElevatedButton.icon(
                          onPressed: onPressed,
                          icon: const SizedBox(),
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
  }

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Column(
      children: [
        CustomCardsCommon(
          child: CustomContainerService(
            title: 'Taxi Solidale',
            subtitle:
                'Ti aiutiamo a raggiungere strutture e servizi primari in città',
            image: PathConstants.taxiSolidale,
            widget: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TaxiSolidalePage(
                                    
                                    )));
                      },
                      child: Text(
                        'Richiedi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(
                          title: TextConstants.infoAlertTitleTaxiSolidale,
                          desc: TextConstants.infoAlertTaxiSolidale,
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TaxiSolidalePage(
                                        
                                        )));
                          });
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(PathConstants.infoService),
                    ),
                  ),
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
            widget: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  AccompagnamentoOncologicoPage(
                                    
                                    )));
                      },
                      child: Text(
                        'Richiedi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(
                        title: TextConstants.infoAlertTitleAccompagnOncol,
                        desc: TextConstants.infoAlertAccompagnOncol,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  AccompagnamentoOncologicoPage(
                                       
                                      )));
                        },
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(PathConstants.infoService),
                    ),
                  ),
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
            title: 'Banco Alimentare',
            subtitle: 'Prenota o conferma il ritiro del tuo pacco alimentare',
            image: PathConstants.bancoAlim,
            widget: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IntroBancoAlimentare()));
                      },
                      child: Text(
                        'Richiedi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(
                        title: TextConstants.infoAlertTitleBancoAlim,
                        desc: TextConstants.infoAlertBancoAlim,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IntroBancoAlimentare()));
                        },
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(PathConstants.infoService),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
