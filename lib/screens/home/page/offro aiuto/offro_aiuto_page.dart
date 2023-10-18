import 'package:flutter/material.dart';

import '../../../common_widgets/background_style/custom_appbar.dart';
import 'form_offro_aiuto.dart';

class OffroAiutoPage extends StatefulWidget {
  const OffroAiutoPage({super.key});

  @override
  State<OffroAiutoPage> createState() => _OffroAiutoPageState();
}

class _OffroAiutoPageState extends State<OffroAiutoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
          
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(context)
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              
              FormOffroAiuto()
            ],
          ),
        ),
      ),
    );
  }
}
