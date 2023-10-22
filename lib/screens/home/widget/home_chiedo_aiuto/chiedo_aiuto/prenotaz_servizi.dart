import 'package:flutter/material.dart';

import '../../../../common_widgets/background_style/custom_appbar.dart';
import 'form_prenot_servizio.dart';

class PrenotazioneServizio extends StatefulWidget {
  const PrenotazioneServizio({super.key});

  @override
  State<PrenotazioneServizio> createState() => _PrenotazioneServizioState();
}

class _PrenotazioneServizioState extends State<PrenotazioneServizio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(
            context, true
          )),
      body: const SingleChildScrollView(child: FormPrenotazioneServizio()),
    );
  }
}