import 'package:flutter/material.dart';


import '../../common_widgets/background_style/appbar_pages.dart';
import '../widget/home_chiedo_aiuto/home_chiedo_aiuto.dart';
import '../widget/home_offro_aiuto/home_offro_aiuto.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String richiesta;
   HomePage({
    Key? key,
    required this.richiesta,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: appBarPages(context),),
      body: widget.richiesta == 'Chiedo Aiuto' ? 
      HomeChiedoAiuto(widget.richiesta) : HomeOffroAiuto(widget.richiesta)
    );
  }
}
