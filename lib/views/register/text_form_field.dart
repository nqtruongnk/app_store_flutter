import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final String hintText;
  final Icon prefixIcon;
  final dynamic suffixIcon;
  final TextEditingController controller;
  final dynamic validator;
  InputTextField(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.controller,
      this.validator})
      : super(key: key);

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool obsCure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.suffixIcon == null
              ? false
              : obsCure
                  ? true
                  : false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xFFe7edeb),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obsCure = !obsCure;
                      });
                    },
                    icon:
                        Icon(obsCure ? Icons.visibility : Icons.visibility_off))
                : null,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
