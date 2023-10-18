import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../const/color_constants.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_textfield.dart';
import '../../../common_widgets/validator_email/validator_email.dart';
import '../../../signup/service/service.dart';

class FormDatiAnagrafici extends StatefulWidget {
  const FormDatiAnagrafici({super.key});

  @override
  State<FormDatiAnagrafici> createState() => _FormDatiAnagraficiState();
}

class _FormDatiAnagraficiState extends State<FormDatiAnagrafici> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numeroComponentiController =
      TextEditingController();
  final TextEditingController _etaComponentiController =
      TextEditingController();
  final TextEditingController _tipoDocController = TextEditingController();
  bool isCheck = false;
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
    return Padding(
              padding: const EdgeInsets.all(20.0,
),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dati Anagrafici',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
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
                          textEditingController: _nameController,
                          labelTextCustom: 'Nome:',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Richiesto*';
                            }
                            return null;
                          },
                        ),
                        TextFormFieldCustom(
                          textEditingController: _surnameController,
                          labelTextCustom: 'Cognome:',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Richiesto*';
                            }
                            return null;
                          },
                        ),
                        TextFormFieldCustom(
                          textEditingController: _emailController,
                          labelTextCustom: 'Email:',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Richiesto*';
                            } else if (!Validators.isValidEmail(value)) {
                                return 'Inserisci un\' email valida';
                              }
                            return null;
                          },
                        ),
                        TextFormFieldCustom(
                          textEditingController: _telephoneController,
                          labelTextCustom: 'Telefono:',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Richiesto*';
                            }
                            return null;
                          },
                        ),
                        TextFormFieldCustom(
                          textEditingController: _addressController,
                          labelTextCustom: 'Indirizzo:',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Richiesto*';
                            }
                            return null;
                          },
                        ),
                        TextFormFieldCustom(
                          textEditingController:
                              _numeroComponentiController,
                          labelTextCustom: 'N° Componenti Familiari:',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Richiesto*';
                            }
                            return null;
                          },
                        ),
                        TextFormFieldCustom(
                          textEditingController: _etaComponentiController,
                          labelTextCustom: 'Età Componenti Familiari:',
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Richiesto*';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide(
                                // ======> CHANGE THE BORDER COLOR HERE <======
                                color: ColorConstants.orangeGradients3,
                                // Give your checkbox border a custom width
                                width: 1.5,
                              ),
                              checkColor: ColorConstants
                                  .orangeGradients3, // color of tick Mark
                              activeColor:
                                  ColorConstants.colorDoctNotActive,
                              value: isCheck,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue!;
                                });
                              },
                            ),
                            Flexible(
                                child: Text(
                              'Nel nucleo familiare è presente una persona con disabilità',
                            ))
                          ],
                        ),
                        Text(
                          '(Se sì, spuntare la casella)',
                          style: TextStyle(
                              color: ColorConstants.orangeGradients3),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Carica i Tuoi Documenti',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: ColorConstants.titleText),
                            ),
                          ],
                        ),
                        TextFormFieldCustom(
                          textEditingController: _tipoDocController,
                          labelTextCustom: 'Tipo di Documento:',
                          obscureText: false,
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
                                                color: ColorConstants.orangeGradients3,
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
                            Map<String, String> body = {
                              'tipo_documento': _tipoDocController.text,
                            };
                            service.addImage(body, imagesList);
                          if(_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                            /*FocusScope.of(context).unfocus();
                                            bloc.add(SignUpTappedEvent()); */
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
    );
  }
}
