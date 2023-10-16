import 'package:flutter/material.dart';

import '../../../common_widgets/background_style/background_style.dart';
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
        body: SingleChildScrollView(
          child: Stack(
            children: [
              BackgroundStyle(
                iconBack: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              FormOffroAiuto()
            ],
          ),
        ),
      ),
    );
  }
}
