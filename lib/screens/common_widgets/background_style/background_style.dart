import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/common_widgets/background_style/footer_wave.dart';
import 'package:anf_app/screens/common_widgets/background_style/top_wave_clipper.dart';
import 'package:anf_app/screens/common_widgets/custom_button.dart';
import 'package:anf_app/screens/signin/page/signin_page.dart';
import 'package:flutter/material.dart';

class BackgroundStyle extends StatelessWidget {
  final String image;
   bool? button;
   BackgroundStyle({required this.image, this. button,});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
           Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                mainAxisAlignment: button == true ? MainAxisAlignment.spaceAround : MainAxisAlignment.end,
                children: [
                  Image.asset(image, width: MediaQuery.of(context).size.width / 2.5,),
                 button == true ? CommonStyleButton(title: 'Accedi', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SignInPage()));
                 }) : SizedBox()
                ],
              ),
              WavyHeader(),],
          ),
          Expanded(child: Container()),
         const Stack(alignment: Alignment.bottomLeft,
          children: [
            WavyFooter(),
            CircleOrange(),
            CircleYellow(),
          ],)
        ],
      ),
    );
  }
}

class WavyHeader extends StatelessWidget {
  const WavyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFFF9844),
          Color(0xFFFE8853),
          Color(0xFFEF6E31),
        ],
        begin: Alignment.topLeft,
        end: Alignment.center,
        )),
      ),
    );
  }
}


class WavyFooter extends StatelessWidget {
  const WavyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
 Color(0xFFFF9844),
          Color(0xFFFE8853),
        ],
        begin: Alignment.center,
        end: Alignment.bottomRight,
        )),
      ),
    );
  }
}


class CircleOrange extends StatelessWidget {
  const CircleOrange({super.key});

  @override
  Widget build(BuildContext context) {
    return  Transform.translate(
      offset: const  Offset(-70, 120),
      child: const Material(
        color: Color(0xFFFE8853),
        shape: CircleBorder(side: BorderSide(color: Color(0xFFF8C97A), width: 15.0)),
        child: Padding(padding: EdgeInsets.all(120)),
      ),
    );
  }
}

class CircleYellow extends StatelessWidget {
  const CircleYellow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Transform.translate(
      offset: const  Offset(0.0, 210.0),
      child: const Material(
        color: Color(0xFFffea00),
        shape: CircleBorder(side: BorderSide(color: Color(0xFFfff699), width: 15.0)),
        child: Padding(padding: EdgeInsets.all(140)),
      ),
    );
  }
}