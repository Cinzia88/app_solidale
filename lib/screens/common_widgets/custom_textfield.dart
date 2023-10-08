


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
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: TextField(
          
          focusNode: focusNode,
          controller: widget.controller,
          obscureText: stateObscureText,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          style: const TextStyle(
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
              fontSize: 16,
            ),
            filled: true,
            fillColor: ColorConstants.textFieldBackground,
          ),
         
        ),
      ),
    );
  }
}


class TextFormFieldCustom extends StatelessWidget {
  final String labelTextCustom;
  final String? errorText;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final bool? obscure;
  final Widget? widgetIcon;
  final Function(String)? onChanged;

  const TextFormFieldCustom({
    Key? key,
    required this.labelTextCustom,
    required this.textEditingController,
    this.validator,
    this.obscure,
    this.widgetIcon,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        cursorColor: ColorConstants.cursor,
        enableInteractiveSelection: true,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: textEditingController,
        obscureText: obscure!,
        autocorrect: true,
        validator: validator,
        maxLines: obscure == false ? null : 1,
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
),
          counterStyle: TextStyle(color: Colors.amber),
          errorStyle: TextStyle(color: Colors.black12),
          labelStyle: const TextStyle(color: ColorConstants.labelText),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.enabledBorder),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.focusBorder),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          labelText: labelTextCustom,
          errorText: errorText,
          prefixIcon: widgetIcon,
          suffixIcon: IconButton(
            onPressed: () {
              textEditingController.clear();
            },
            icon: const Icon(
              Icons.clear,
              color: ColorConstants.buttonClear,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}