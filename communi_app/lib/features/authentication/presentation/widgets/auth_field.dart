import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      this.isObscure = false});
  final String hintText;
  final TextEditingController textEditingController;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isObscure,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
