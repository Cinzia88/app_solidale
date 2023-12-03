import 'dart:io';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/common_widgets/custom_button.dart';
import 'package:app_solidale/screens/common_widgets/custom_textfield.dart';
import 'package:app_solidale/screens/menu/area_personale/profilo_page.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/bloc/send_docs_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/form_docs.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/repository/send_docs_repository.dart';
import 'package:app_solidale/service/service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider<SendDocsBloc>(
      create: (context) => SendDocsBloc(
        context: context,
        sendDocsRepository: context.read<SendDocsRepository>(),
      ),
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
          body: BlocConsumer<SendDocsBloc, SendDocsState>(
 listener: (context, state) {
            if (state is SendDocsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          }, builder: (context, state) {              return FormDocs();
            }
          )),
    );
  }
}
