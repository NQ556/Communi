import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.buttonText, this.onTap});
  final String buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        width: 200,
        child: Center(
          child: Text(buttonText,
              style: Theme.of(context)
                  .textButtonTheme
                  .style
                  ?.textStyle
                  ?.resolve({})),
        ),
      ),
      style: Theme.of(context).textButtonTheme.style,
    );
  }
}
