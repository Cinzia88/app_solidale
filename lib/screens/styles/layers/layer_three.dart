import 'dart:ffi';

import 'package:anf_app/screens/styles/layers/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LayerThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Text(
            'Username',
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          Container(
            width: 310,
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter User ID or Email',
                hintStyle: TextStyle(color: hintText),
              ),
            ),
          ),
          Text(
            'Password',
            style: TextStyle(
                fontFamily: 'Poppins-Medium',
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          Container(
            width: 310,
            child: TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter Password',
                hintStyle: TextStyle(color: hintText),
              ),
            ),
          ),
          Text(
            'Forgot Password',
            style: TextStyle(
                color: forgotPasswordText,
                fontSize: 16,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w600),
          ),
          Checkbox(
            checkColor: Colors.black,
            activeColor: checkbox,
            value: isChecked,
            onChanged: (bool? value) {
              isChecked = value!;
            },
          ),
          Text(
            'Remember Me',
            style: TextStyle(
                color: forgotPasswordText,
                fontSize: 16,
                fontFamily: 'Poppins-Medium',
                fontWeight: FontWeight.w500),
          ),
          Container(
            width: 99,
            height: 35,
            decoration: BoxDecoration(
              color: signInButton,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            height: 0.5,
            width: 310,
            color: inputBorder,
          ),
          
        ],
      ),
    );
  }
}