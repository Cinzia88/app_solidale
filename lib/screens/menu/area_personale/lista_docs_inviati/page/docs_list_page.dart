



import 'package:app_solidale/screens/common_widgets/background_style/custom_appbar.dart';
import 'package:app_solidale/screens/menu/menu_appbar.dart/menu.dart';
import 'package:flutter/material.dart';

class ListDocsPage extends StatefulWidget {
  const ListDocsPage({super.key});

  @override
  State<ListDocsPage> createState() => _ListDocsPageState();
}

class _ListDocsPageState extends State<ListDocsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
           iconTheme: const IconThemeData(
            color: Colors.white,
           ),
            toolbarHeight: 75.0,
            automaticallyImplyLeading: true,
            flexibleSpace: customAppBar(context: context),
             actions: [
              IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back, color: Colors.white,))
            ],
          ),
          drawer: NavigationDrawerWidget(),
          body: Text(''),
    );
  }
}