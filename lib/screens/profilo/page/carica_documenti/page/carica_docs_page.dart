import 'dart:io';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/profilo/page/profile_page.dart';
import 'package:app_solidale/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CaricaDocsPage extends StatefulWidget {
  const CaricaDocsPage({super.key});

  @override
  State<CaricaDocsPage> createState() => _CaricaDocsPageState();
}

class _CaricaDocsPageState extends State<CaricaDocsPage> {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return  Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context: context, onPressed: () => Navigator.pop(context), arrow: true )),
        body:  SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Carica I Tuoi Documenti',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 3 * blockSizeVertical,
                              color: ColorConstants.titleText),
                        ),
                      ],
                    ),
                    const Divider(
                      color: ColorConstants.orangeGradients3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            
                            TextFormFieldCustom(
                              textEditingController: _tipoDocController,
                              labelTextCustom: 'Tipo di Documento:',
                              obscureText: false,
                               validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo Richiesto*';
                                }
                                return null;
                              },
                            ),
                            Column(
                              children: [
                                GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                                color: const Color.fromRGBO(
                                                    255, 255, 244, 0.7),
                                                child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      imagesList
                                                          .removeAt(index);
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
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        onPrimary:
                                            ColorConstants.orangeGradients3),
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          backgroundColor: Colors.white,
                                          icon: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.close,
                                                  color: ColorConstants
                                                      .orangeGradients3,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          title: const Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Seleziona file',
                                                    style: TextStyle(
                                                        color: ColorConstants
                                                            .orangeGradients3,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  onPrimary: ColorConstants
                                                      .orangeGradients3),
                                              onPressed: () {
                                                _pickImage(ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                              label: const Text('Galleria'),
                                              icon: const Icon(Icons.image),
                                            ),
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  onPrimary: ColorConstants
                                                      .orangeGradients3),
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
                                )),
                              ],
                            ),
                            
                            SizedBox(
                              height: 20,
                            ),
                            CommonStyleButton(
                              title: 'Invia',
                              iconWidget: Icon(Icons.send),
                              onTap: () {
                                
                                if (_formKey.currentState!.validate()) {
                                   
                                Map<String, String> body = {
                                  'tipo_documento': _tipoDocController.text ,
                                };
                                service.addImage(body, imagesList);
Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => ProfilePage()));
                                   FocusScope.of(context).unfocus();
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
          }
      
      
  
}

