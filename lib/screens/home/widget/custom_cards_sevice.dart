import 'package:flutter/material.dart';

class CustomCardsService extends StatefulWidget {
  const CustomCardsService({super.key});

  @override
  State<CustomCardsService> createState() => _CustomCardsServiceState();
}

class _CustomCardsServiceState extends State<CustomCardsService> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 3.5, right: 20, left: 20),
      child: Column(
        children: [
          Flexible(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20),
              children: [
                Material(
                  elevation: 10,
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30))),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30))),
                    child: Center(child: Text('Prenotazione Servizi')),
                  ),
                ),
                Material(
                  elevation: 10,
                  color: Colors.white,
                   shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30))),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30))),
                    child: Center(child: Text('Banco Alimentare')),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
