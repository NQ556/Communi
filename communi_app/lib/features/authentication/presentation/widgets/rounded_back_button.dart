import 'package:communi_app/core/utils/color_manager.dart';
import 'package:communi_app/core/utils/font_manager.dart';
import 'package:flutter/material.dart';

class RoundedBackButton extends StatelessWidget {
  const RoundedBackButton({super.key, required this.buttonText, this.onTap});
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
                style: TextStyle(
                    fontFamily: FontFamilyConstants.fontFamily_2,
                    fontWeight: FontWeightManager.regular,
                    fontSize: 24,
                    color: ColorManager.primary)),
          ),
        ),
        style: TextButton.styleFrom(backgroundColor: ColorManager.white50));
  }
}
