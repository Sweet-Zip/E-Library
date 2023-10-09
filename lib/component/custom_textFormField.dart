import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.validValue,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final String validValue;

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty || value == hintText) {
      return validValue;
    }
    return null; // Return null for no validation error
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outLine(Color color) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color,width: 1.5),
        borderRadius: BorderRadius.circular(10.0),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: _validateInput,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: outLine(Color(0xff00AEEF)),
          focusedBorder: outLine(Color(0xff008CCF)),
          errorBorder: outLine(Colors.red),
          focusedErrorBorder: outLine(Color(0xff008CCF)),
        ),
      ),
    );
  }
}
