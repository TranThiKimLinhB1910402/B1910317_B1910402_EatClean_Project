import 'package:flutter/material.dart';

class RegisterInput extends StatelessWidget {
  final String name;
  final IconData? icon;
  final int maxlength;
  const RegisterInput({
    Key? key,
    required this.name,
    this.icon,
    required this.maxlength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
          maxLength: maxlength,
          decoration: InputDecoration(
            hintText: name,
            labelText: name,
            prefixIcon: Icon(icon),
          ));
  }
}
