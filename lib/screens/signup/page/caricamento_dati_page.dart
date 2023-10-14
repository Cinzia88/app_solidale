import 'dart:io';

import 'package:anf_app/const/text_constants.dart';
import 'package:anf_app/screens/common_widgets/custom_button.dart';
import 'package:anf_app/screens/common_widgets/custom_textfield.dart';
import 'package:anf_app/screens/signup/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class CaricamentoDati extends StatefulWidget {
  const CaricamentoDati({super.key});

  @override
  State<CaricamentoDati> createState() => _CaricamentoDatiState();
}

class _CaricamentoDatiState extends State<CaricamentoDati> {
    final _formKey = GlobalKey<FormState>();
final TextEditingController _tipoDocController = TextEditingController();
Service service = Service();
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
    return  SafeArea(
      child: Scaffold(
        body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormFieldCustom(
              textEditingController: _tipoDocController,
              labelTextCustom: 'Tipo di Documento:',
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
              title: TextConstants.signUp,
              iconWidget: Icon(Icons.login),
              onTap: () {
                Map<String, String> body = {
                  'tipo_documento': _tipoDocController.text,
                  
                };
                service.addImage(body, imagesList).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_) => CaricamentoDati())));
    
                /*FocusScope.of(context).unfocus();
                      bloc.add(SignUpTappedEvent()); */
              },
            ),
          ],
        ),
      ),
      ),
    );
  }
}