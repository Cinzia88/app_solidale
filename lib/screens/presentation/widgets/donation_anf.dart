import 'package:flutter/material.dart';

import '../../../const/color_constants.dart';


Widget donationAnf(BuildContext context) {
return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Vuoi sostenere l\'ANF?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                 
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    primary: ColorConstants.primaryColor,
                    onPrimary: Colors.white),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DONA ORA',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ]),
              ),
            ],
          );
}