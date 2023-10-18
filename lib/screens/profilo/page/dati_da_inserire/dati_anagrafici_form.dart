import 'package:flutter/material.dart';

import 'package:anf_app/screens/common_widgets/background_style/custom_appbar.dart';

import 'dati_form.dart';

class FormProfilePage extends StatefulWidget {
  @override
  State<FormProfilePage> createState() => _FormProfilePageState();
}

class _FormProfilePageState extends State<FormProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        
        preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
        child: customAppBar(context, true)
      ),
      body: const SingleChildScrollView(
        child: 
            FormDatiAnagrafici()
          
        
      ),
    );
  }
}
