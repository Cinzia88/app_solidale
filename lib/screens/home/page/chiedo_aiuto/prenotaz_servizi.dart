import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/background_style/background_style.dart';
import 'form_prenot_servizio.dart';

class PrenotazioneServizio extends StatefulWidget {
  const PrenotazioneServizio({super.key});

  @override
  State<PrenotazioneServizio> createState() => _PrenotazioneServizioState();
}

class _PrenotazioneServizioState extends State<PrenotazioneServizio> {
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: SingleChildScrollView(
          child: Stack(

            children: [
              BackgroundStyle(iconBack: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () => Navigator.pop(context),),),
             FormPrenotazioneServizio()
            ],
          ),
        ),
      ),
    );
  }
}
