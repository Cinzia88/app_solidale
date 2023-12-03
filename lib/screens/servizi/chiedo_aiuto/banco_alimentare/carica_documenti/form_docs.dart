

import 'dart:io';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/common_widgets/loading_widget.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/bloc/send_docs_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/bloc/send_parents_data_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class FormDocs extends StatefulWidget {
  const FormDocs({super.key});

  @override
  State<FormDocs> createState() => _FormDocsState();
}

class _FormDocsState extends State<FormDocs> {
    final _formKey = GlobalKey<FormState>();
  final TextEditingController _tipoDocController = TextEditingController();
  final List<File> imagesList = [];
  final List<File> filePdf = [];

  bool deletedImage = false;

  Future _pickImage(ImageSource imageSource) async {
    try {
      final List<XFile> selectedImage = await ImagePicker().pickMultiImage();

      if (selectedImage.isNotEmpty) {
        setState(() {
          var selectedPostImages =
              selectedImage.map<File>((xfile) => File(xfile.path)).toList();
          imagesList.addAll(selectedPostImages);
        });
      }
    } on PlatformException catch (e) {
      print('errorImage $e');
    }
  }

  Future _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );
      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        setState(() {
          filePdf.addAll(files);
        });
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      print('errorImage $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
        final bloc = BlocProvider.of<SendDocsBloc>(context);

    return BlocBuilder<SendDocsBloc, SendDocsState>(builder: (context, state) {
     
      return state is SendDocsLoadingState ? loadingWidget(context ) :SingleChildScrollView(
                  child: Padding(
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
                                  GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
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
                                                File(imagesList[index].path),
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
                                        label: const Text('Scegli immagine'),
                                        icon: const Icon(Icons.image),
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: filePdf.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                          filePdf[index].path.split('/').last);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        onPrimary: ColorConstants.orangeGradients3),
                                    onPressed: () async {
                                      _pickFile();
    
                                      setState(() {
                                        deletedImage = false;
                                      });
                                    },
                                    label: const Text('Carica PDF'),
                                    icon: const Icon(Icons.picture_as_pdf),
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
                                          'nome': _tipoDocController.text,
                                        };
                                        bloc.add(SendDocsFormEvent(body: body, imagepath: imagesList, pdfpath: filePdf));
                                        
                                      
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
              ));
  });}
}