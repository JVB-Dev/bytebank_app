import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType inputType;
  final IconData? icon;

  const Editor(
    this.controller, {
    required this.labelText,
    required this.hintText,
    required this.inputType,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
            labelText: labelText,
            hintText: hintText,
          ),
          style: const TextStyle(fontSize: 16.0)),
    );
  }
}
