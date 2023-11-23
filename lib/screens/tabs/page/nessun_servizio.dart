import 'package:app_solidale/screens/common_widgets/background_style/appbar_pages.dart';
import 'package:flutter/material.dart';

class NessunServizioPage extends StatelessWidget {
  const NessunServizioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: appBarPages(context),),
      body: Center(child: Text('Al momento non ci sono servizi'),),);
  }
}