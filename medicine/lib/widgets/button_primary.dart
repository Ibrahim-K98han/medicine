import 'package:flutter/material.dart';
import 'package:medicine/theme.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary({super.key, this.text, this.onTap});

  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: greenColor,
          foregroundColor: whiteColor,
        ),
        child: Text(text!),
      ),
    );
  }
}
