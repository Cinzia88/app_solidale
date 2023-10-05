


import 'package:anf_app/const/color_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String placeholder;
  final String errorText;
  final bool obscureText;
  final bool isError;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  const CustomTextField({
    Key? key,
    required this.title,
    required this.placeholder,
    required this.errorText,
    required this.obscureText,
    required this.isError,
    required this.controller,
    required this.textInputAction,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

final focusNode = FocusNode();
  bool stateObscureText = false;
  bool stateIsError = false;


   @override
  void initState() {
    super.initState();

    focusNode.addListener(
      () {
        setState(() {
          if (focusNode.hasFocus) {
            stateIsError = false;
          }
        });
      },
    );

    stateObscureText = widget.obscureText;
    stateIsError = widget.isError;
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    stateObscureText = widget.obscureText;
    stateIsError = focusNode.hasFocus ? false : widget.isError;
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TextField(
        
        focusNode: focusNode,
        controller: widget.controller,
        obscureText: stateObscureText,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        style: TextStyle(
          color: ColorConstants.textBlack,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: stateIsError ? ColorConstants.errorColor : ColorConstants.textFieldBorder.withOpacity(0.4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: ColorConstants.primaryColor,
            ),
          ),
          hintText: widget.placeholder,
          hintStyle: TextStyle(
            color: ColorConstants.grey,
            fontSize: 16,
          ),
          filled: true,
          fillColor: ColorConstants.textFieldBackground,
        ),
       
      ),
    );
  }
}