import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/text_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_cards_common.dart';
import 'package:app_solidale/screens/home/widgets/custom_container_service.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/edit_acc_onc/page_edit_acc.onc.dart';

import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/page/intro.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/page/taxi_solidale.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/accompagnamento_oncologico/page/page_acc_onc.dart';
import 'package:flutter/material.dart';
import '../../../../const/path_constants.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'as globals;


List<String> serviceId = [
  '2',
  '3',
  '4'
];

Widget customEditCardsServiceChiedoAiuto(BuildContext context) {
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
 return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: globals.listRequestData.length,
      itemBuilder: (context, index) {
        return Column(
      children: [
       CustomCardsCommon(
          child: CustomContainerService(
            serviceId: serviceId[0],
            title: 'Taxi Solidale',
            subtitle:
                'Ti aiutiamo a raggiungere strutture e servizi primari in città',
            image: PathConstants.taxiSolidale,
            widget: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        globals.listRequestData[index].serviceId == serviceId[0] ?   ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TaxiSolidalePage()));
                      },
                      child: Text(
                        'Modifica',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: blockSizeVertical * 2),
                      )) : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TaxiSolidalePage()));
                      },
                      child: Text(
                        'Richiedi',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: blockSizeVertical * 2),
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
                                    builder: (context) =>
                                        const TaxiSolidalePage()));
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
            serviceId: serviceId[1],
            title: 'Accompagnamento Oncologico',
            subtitle: 'Ti supportiamo per ricevere le cure necessarie',
            image: PathConstants.accompagnamOncolog,
            widget: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            globals.listRequestData[index].serviceId == serviceId[1] ?   ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AccompagnamentoOncologicoEditPage(idRequest: globals.listRequestData[index])));
                      },
                      child: Text(
                        'Modifica',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: blockSizeVertical * 2),
                      )) : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AccompagnamentoOncologicoPage()));
                      },
                      child: Text(
                        'Richiedi',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: blockSizeVertical * 2),
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
                                  builder: (context) =>
                                      AccompagnamentoOncologicoPage()));
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
            serviceId: serviceId[2],
            title: 'Banco Alimentare',
            subtitle: 'Prenota o conferma il ritiro del tuo pacco alimentare',
            image: PathConstants.bancoAlim,
            widget: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
           globals.listRequestData[index].serviceId == serviceId[2] ?     ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IntroBancoAlimentare()));
                      },
                      child: Text(
                        'Modifica',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: blockSizeVertical * 2),
                      )) : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IntroBancoAlimentare()));
                      },
                      child: Text(
                        'Richiedi',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: blockSizeVertical * 2),
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
                                  builder: (context) =>
                                      IntroBancoAlimentare()));
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
        ]);
}));
    
      
    
}
