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
        CustomCardsCommon(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageInfo(
                                      infoTitle: 'Info: Taxi Solidale',
                                      infoDescription:
                                          'Questo servizio di natura assistenziale è completamente gratuito, utile per aiutare quei cittadini in condizioni di difficoltà a raggiungere strutture e servizi primari nella città di Taranto. \nPossono usufruire di questo servizio: \n- Portatori di gravi patologie \n- Anziani oltre i 65 anni di età che non possono muoversi autonomamente \n- Invalidi adulti (oltre il 66%) e portatori di disabilità \n- Persone adulte segnalate dai servizi sociali \n- Minori disabili accompagnati da un genitore o tutore',
                                      widgetButton: CommonStyleButton(
                                          title: 'Vai al servizio',
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FormServizio(title: 'Servizio: Taxi Solidale',))),
                                          iconWidget: Icon(Icons.taxi_alert)),
                                    )));
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
                                          'Info: Accompagnamento Oncologico',
                                      infoDescription: 'Vicini alle famiglie che stanno affrontando il difficile percorso delle cure oncologiche, mettiamo a disposizione dei minibus per dare la possibilità di accompagnare il proprio caro e ricevere le cure necessarie. \nI nostri volontari hanno un grande cuore e ci aiutano a tenere vivo questo servizio trasportando il malato nei giorni e gli orari stabiliti presso la struttura e riaccompagnandolo a casa una volta finita la terapia.',
                                      widgetButton: CommonStyleButton(
                                          title: 'Vai al servizio',
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FormServizio(title: 'Servizio: Accompagnamento Oncologico',))),
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
                                          'Info: Banco Alimentare',
                                      infoDescription: 'L\'organizzazione non profit ANF Associazione Nazionale Famiglie partecipa al Programma di Aiuti Europei agli Indigenti (PO I FEAD) in qualità di Organizzazione partner Territoriale (OpT), provvedendo alla distribuzione di aiuti alimentari cofinanziati dal Fondo di Aiuti Europei agli Indigenti (FEAD) e all’erogazione di misure di accompagnamento per orientare e sostenere le persone in condizione di bisogno.',
                                          widgetButton: CommonStyleButton(
                                          title: 'Vai al servizio',
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FormServizio(title: 'Servizio: Banco Alimentare',))),
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
