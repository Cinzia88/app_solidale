import 'package:app_solidale/const/color_constants.dart';
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
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SizedBox(
                                    height: 200,
                                    child: Center(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Text(
                                              'Taxi Solidale',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorConstants
                                                      .orangeGradients3,
                                                  fontSize: 20),
                                            ),
                                            const Text(
                                                'Questo servizio di natura assistenziale è completamente gratuito, utile per aiutare quei cittadini in condizioni di difficoltà a raggiungere strutture e servizi primari nella città di Taranto. \nPossono usufruire di questo servizio: \n- Portatori di gravi patologie \n- Anziani oltre i 65 anni di età che non possono muoversi autonomamente \n- Invalidi adulti (oltre il 66%) e portatori di disabilità \n- Persone adulte segnalate dai servizi sociali \n- Minori disabili accompagnati da un genitore o tutore'),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: ElevatedButton.icon(
                                                    icon:
                                                        const Icon(Icons.close),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    label: const Text('Chiudi'),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: ElevatedButton.icon(
                                                    icon: const Icon(
                                                        Icons.taxi_alert),
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
                                                                        'Servizio: Taxi Solidale',
                                                                  )));
                                                    },
                                                    label:
                                                        const Text('Richiedi'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        iconWidget: Icon(Icons.info)),
                  )
                  /*Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TaxiInfo()));
                      },
                      icon: Icon(Icons.info),
                      label: Text('Info'),
                    ),
                  )), */
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageInfo(
                                      infoTitle:
                                          'Cos\'è \nl\' Accompagnamento Oncologico?',
                                      infoDescription:
                                          'Vicini alle famiglie che stanno affrontando il difficile percorso delle cure oncologiche, mettiamo a disposizione dei minibus per dare la possibilità di accompagnare il proprio caro e ricevere le cure necessarie. \nI nostri volontari hanno un grande cuore e ci aiutano a tenere vivo questo servizio trasportando il malato nei giorni e gli orari stabiliti presso la struttura e riaccompagnandolo a casa una volta finita la terapia.',
                                      image: PathConstants.accompagnamOncolog,
                                      widgetButton: CommonStyleButton(
                                          title: 'Vai al servizio',
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const FormServizio(
                                                        image: PathConstants
                                                            .accompagnamOncolog,
                                                        title:
                                                            'Richiesta: \nAccompagnamento Oncologico',
                                                      ))),
                                          iconWidget: Icon(Icons.bus_alert)),
                                    )));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageInfo(
                                      infoTitle:
                                          'Cos\'è il \nBanco Alimentare?',
                                      infoDescription:
                                          'L\'organizzazione non profit ANF Associazione Nazionale Famiglie partecipa al Programma di Aiuti Europei agli Indigenti (PO I FEAD) in qualità di Organizzazione partner Territoriale (OpT), provvedendo alla distribuzione di aiuti alimentari cofinanziati dal Fondo di Aiuti Europei agli Indigenti (FEAD) e all’erogazione di misure di accompagnamento per orientare e sostenere le persone in condizione di bisogno.',
                                      image: PathConstants.bancoAlim,
                                      widgetButton: CommonStyleButton(
                                          title: 'Vai al servizio',
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const FormServizio(
                                                        image: PathConstants
                                                            .bancoAlim,
                                                        title:
                                                            'Richiesta: \nBanco Alimentare',
                                                      ))),
                                          iconWidget: Icon(Icons.food_bank)),
                                    )));
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
