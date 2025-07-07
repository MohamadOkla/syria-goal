import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({super.key, required this.hintText, required this.myIcon});
  String hintText;
  Icon myIcon;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: widget.myIcon,
          hintText: widget.hintText,
        ),
        style: TextStyle(fontSize: 16, color: Colors.black),
        textAlign: TextAlign.right,
      ),
    );
  }
}
