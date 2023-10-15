import 'dart:io';

import 'package:anf_app/const/text_constants.dart';
import 'package:anf_app/main.dart';
import 'package:anf_app/screens/common_widgets/custom_cards_common.dart';
import 'package:anf_app/screens/signup/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

import 'package:anf_app/screens/common_widgets/background_style/background_style.dart';
import 'package:anf_app/screens/common_widgets/custom_textfield.dart';

import '../../../../const/color_constants.dart';
import '../../../common_widgets/custom_button.dart';
import 'dati_form.dart';



class FormProfilePage extends StatefulWidget {
  @override
  State<FormProfilePage> createState() => _FormProfilePageState();
}

class _FormProfilePageState extends State<FormProfilePage> {
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: SingleChildScrollView(
          child: Stack(

            children: [
              BackgroundStyle(iconBack: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () => Navigator.pop(context),),),
             FormDatiAnagrafici()
            ],
          ),
        ),
      ),
    );
  }
}
