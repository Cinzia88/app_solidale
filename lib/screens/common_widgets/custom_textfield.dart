


import 'package:app_solidale/const/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class TextFormFieldCustom extends StatelessWidget {
  final String labelTextCustom;
  final String? errorText;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final bool? obscure;
  final Widget? widgetIcon;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final void Function()? onTap;

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
    this.keyboardType,
    this.inputFormatters,
    this.readOnly,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        readOnly: readOnly ?? false,
        cursorColor: ColorConstants.cursor,
        enableInteractiveSelection: true,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: textEditingController,
        autocorrect: true,
        inputFormatters: inputFormatters,
        validator: validator,
        keyboardType: keyboardType,
        onTap: onTap != null ? onTap : null,
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.orangeGradients3),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
),
          errorStyle: const TextStyle(color: ColorConstants.orangeGradients3),
          labelStyle:  TextStyle(color: ColorConstants.labelText, fontSize: 2 * blockSizeVertical),
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
          suffixIcon: textEditingController.text.isNotEmpty ? IconButton(
            onPressed: () {
              textEditingController.clear();
            },
            icon: const Icon(
              Icons.clear,
              color: ColorConstants.buttonClear,
              size: 18,
            ),
          ) : SizedBox(),
        ),
  obscureText: obscureText,
      ),
    );
  }
}