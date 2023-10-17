


import 'package:anf_app/const/color_constants.dart';
import 'package:flutter/material.dart';



class TextFormFieldCustom extends StatelessWidget {
  final String labelTextCustom;
  final String? errorText;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final bool? obscure;
  final Widget? widgetIcon;
  final Function(String)? onChanged;
  final bool obscureText;

  const TextFormFieldCustom({
    Key? key,
    required this.labelTextCustom,
    required this.textEditingController,
    required this.obscureText,
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
        autocorrect: true,
        validator: validator,
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.orangeGradients3),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
),
          errorStyle: TextStyle(color: ColorConstants.orangeGradients3),
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
  obscureText: obscureText,
      ),
    );
  }
}