



import 'package:anf_app/const/path_constants.dart';
import 'package:anf_app/screens/signup/page/signup_page.dart';
import 'package:flutter/material.dart';

class CustomContainerService extends StatefulWidget {
  const CustomContainerService({super.key});

  @override
  State<CustomContainerService> createState() => _CustomContainerServiceState();
}

class _CustomContainerServiceState extends State<CustomContainerService> {
  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: GestureDetector(
        onTap:() => {
          Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()))
        },
        child: Stack(
          alignment: FractionalOffset.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage(PathConstants.onboarding1,),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOver))),
            ),
            Text('Servizi',
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),)
          ]),
      ),
    );
  }
}