import 'package:flutter/material.dart';

import '../../common_widgets/background_style/custom_appbar.dart';



class SingleNewPage extends StatefulWidget {
  const SingleNewPage({super.key});

  @override
  State<SingleNewPage> createState() => _SingleNewPageState();
}

class _SingleNewPageState extends State<SingleNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
          child: customAppBar(
            context, true
          )),
      body: const SingleChildScrollView(child: Text('new')),
    );
  }
}