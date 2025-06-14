import 'package:flutter/material.dart';
import 'package:medicine/theme.dart';

class WidgetIlustration extends StatelessWidget {
  const WidgetIlustration({
    super.key,
    this.child,
    this.image,
    this.title,
    this.subtitle1,
    this.subtitle2,
  });

  final Widget? child;
  final String? image;
  final String? title;
  final String? subtitle1;
  final String? subtitle2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image!, width: 250),
        SizedBox(height: 30),
        Text(
          title!,
          style: regulerTextStyle.copyWith(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Column(
          children: [
            Text(
              subtitle1!,
              style: regulerTextStyle.copyWith(
                fontSize: 15,
                color: greyLightColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle2!,
              style: regulerTextStyle.copyWith(
                fontSize: 15,
                color: greyLightColor,
              ),
            ),
            SizedBox(height: 50),
            child ?? SizedBox(),
          ],
        ),
      ],
    );
  }
}
