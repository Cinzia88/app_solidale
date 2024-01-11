import 'dart:io';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/path_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';

import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/bloc/send_docs_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/bloc_edit_docs/bloc/read_docs_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/model/edit_docs_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/repo/edit_docs_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/repository/send_docs_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CaricaDocsEditPage extends StatefulWidget {
  const CaricaDocsEditPage({super.key});

  @override
  State<CaricaDocsEditPage> createState() => _CaricaDocsEditPageState();
}

class _CaricaDocsEditPageState extends State<CaricaDocsEditPage> {
  final _formKey = GlobalKey<FormState>();
  List<DocsData> dataList = [];
  String path = '';

  String idDocs = '';
  List<File> imagesList = [];
  List<File> filePdf = [];
  final List<String> items = [
    'Carta d\'identità',
    'ISEE',
    'Patente',
  ];
  String selectedValue = 'Carta d\'identità';

  bool deletedImage = false;

  List<String> extensionFile = ['pdf', 'jpeg', 'jpg', 'png'];

  Future _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: extensionFile,
      );
      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        for (int i = 0; i < files.length; i++) {
          if (files[i].path.split('.').last == 'pdf') {
            setState(() {
              filePdf = files;
            });
          } else {
            setState(() {
              imagesList = files;
            });
          }
        }
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      print('errorImage $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return BlocProvider<ReadDocsBloc>(
      create: (context) => ReadDocsBloc(
        context: context,
        editDocsRepository: context.read<EditDocsRepository>(),
      )..add(FetchDocsEvent()),
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),
            actions: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ))
            ],
          ),
          drawer: NavigationDrawerWidget(),
          body: BlocConsumer<ReadDocsBloc, ReadDocsState>(
              listener: (context, state) {
            if (state is ReadDocsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            } else if (state is EditDocsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            } else if (state is ReadDocsLoadedState) {
              for (int i = 0; i < state.data.length; i++) {
                setState(() {
                  selectedValue = state.data[i].nome;
                  idDocs = state.data[i].id;
                  path = state.data[i].path;
                  dataList = state.data;
                });
              }
            }
          }, builder: (context, state) {
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 70,
                    child: Image.asset(
                      PathConstants.bancoAlim,
                    ),
                  ),
                  SizedBox(
                    height: 3 * blockSizeVertical,
                  ),
                  Text(
                    'Banco Alimentare',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Modifica Documenti Caricati',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const Divider(
                    color: ColorConstants.orangeGradients3,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(child: Text('Seleziona il tipo di documento')),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              hint: Text(
                                '',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ColorConstants.labelText,
                                ),
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: ColorConstants.orangeGradients1,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                ),
                                iconSize: 20,
                                iconEnabledColor:
                                    ColorConstants.orangeGradients3,
                                iconDisabledColor: Colors.grey,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                width: MediaQuery.of(context).size.width - 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                          dataList != [] && path.contains('jpg') ||
                                  path.contains('png') ||
                                  path.contains('jpeg')
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemCount: dataList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: CachedNetworkImage(
                                              height: 200,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/storage/files/${dataList[index].path}',
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child: SizedBox(
                                                height: 100,
                                                child:
                                                    CupertinoActivityIndicator(
                                                  color: Color(0xff003b5b),
                                                ),
                                              )),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                PathConstants
                                                    .logoanfcompletovertic,
                                              ),
                                            ),
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
                                                    dataList.removeAt(index);
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
                                  })
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: dataList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        children: [
                                          Text(dataList[index]
                                              .path
                                              .split('/')
                                              .last),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                dataList.removeAt(index);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Image.file(
                                          File(imagesList[index].path),
                                          fit: BoxFit.cover,
                                        ),
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
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: filePdf.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  children: [
                                    Text(filePdf[index].path.split('/').last),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          filePdf.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              _pickFile();

                              setState(() {
                                deletedImage = false;
                              });
                            },
                            label: const Text('Scegli File'),
                            icon: const Icon(Icons.file_copy),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CommonStyleButton(
                                title: 'Aggiorna',
                                iconWidget: SizedBox(),
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Map<String, String> body = {
                                      'nome': selectedValue,
                                    };
                                    EditDocsRepository().editDocs(context,
                                        idDocs, body, imagesList, filePdf);

                                    print('imagesList $imagesList');
                                    print('pdf $filePdf');

                                    SendDataTypeServiceRepository()
                                        .sendMailService(
                                      context,
                                      'Banco Alimentare',
                                    );

                                    FocusScope.of(context).unfocus();
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
          })),
    );
  }
}
