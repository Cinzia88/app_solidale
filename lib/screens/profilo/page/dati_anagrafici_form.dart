
import 'dart:io';

import 'package:anf_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

import 'package:anf_app/screens/common_widgets/background_style/background_style.dart';
import 'package:anf_app/screens/common_widgets/custom_textfield.dart';

import '../../common_widgets/custom_button.dart';


class FormProfilePage extends StatefulWidget {
  

  @override
  State<FormProfilePage> createState() => _FormProfilePageState();
}

class _FormProfilePageState extends State<FormProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child:  Stack(
            children: [
              BackgroundStyle(),
              FormProfile(),
            ],
          ),
        ),
      ),
    );
  }

}




class FormProfile extends StatefulWidget {
  

  @override
  State<FormProfile> createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
    final TextEditingController _telephoneController = TextEditingController();
        final TextEditingController _addressController = TextEditingController();


final List<XFile?> imagesList = [];
  XFile? fileToDisplay;
  bool deletedImage = false;

   Future _pickImage(ImageSource imageSource) async {
    try {
      final XFile? selectedImage =
          await ImagePicker().pickImage(source: imageSource);

      if (selectedImage!.path.isNotEmpty) {
        setState(() {
          imagesList.add(selectedImage);
          fileToDisplay = selectedImage;
        });
      }
      print('pathImageCamera ${fileToDisplay!.path}');
    } on PlatformException catch (e) {
      print('errorImage $e');
    }
  }


  



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 10.0, right: 20, left: 20),
      child: Material(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Dati Anagrafici',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color(0xFFEF6E31)),
                      ),
                      TextFormFieldCustom(
                        textEditingController: _nameController,
                        labelTextCustom: 'Nome:',
                        obscure: false,
                      ),
                      TextFormFieldCustom(
                        textEditingController: _surnameController,
                        labelTextCustom: 'Cognome:',
                        obscure: false,
                      ),
                      TextFormFieldCustom(
                        textEditingController: _telephoneController,
                        labelTextCustom: 'Telefono:',
                        obscure: false,
                      ),
                       TextFormFieldCustom(
                        textEditingController: _addressController,
                        labelTextCustom: 'Indirizzo:',
                        obscure: false,
                      ),
                      Column(children: [GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: imagesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(
                        File(imagesList[index]!.path),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: -4,
                        top: -4,
                        child: Container(
                          color: const Color.fromRGBO(255, 255, 244, 0.7),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                imagesList.removeAt(index);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: 20,
                  shape:  RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(30.0),
                  ),
                  onPrimary: Colors.white),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)),
                    title: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Seleziona file',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: 25,
                            shape:  RoundedRectangleBorder(
                              borderRadius:  BorderRadius.circular(30.0),
                            ),
                            onPrimary: Colors.white),
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        label: const Text('Galleria'),
                        icon: const Icon(Icons.image),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: 25,
                            shape:  RoundedRectangleBorder(
                              borderRadius:  BorderRadius.circular(30.0),
                            ),
                            onPrimary: Colors.white),
                        onPressed: () {
                          _pickImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        label: const Text('Scatta Foto'),
                        icon: const Icon(Icons.camera),
                      ),
                    ],
                  ),
                );

                setState(() {
                  deletedImage = false;
                });
              },
              label: const Text('Scegli file'),
              icon: const Icon(Icons.file_download),
            ),
          )),],),
                      CommonStyleButton(
                        title: 'Invia',
                        onTap: () {
                          setState(() {
                           percent = 1;
                          });
                         Navigator.pop(context);
                          /*FocusScope.of(context).unfocus();
                                bloc.add(SignUpTappedEvent()); */
                        },
                      ),
                   const   SizedBox(
                        height: 20,
                      ),
                     
                    ],
                  ),
                ),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
