import 'package:flutter/material.dart';
import 'package:medicine/theme.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({super.key, this.imageCategory, this.nameCategory});

  final String? imageCategory;
  final String? nameCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('${imageCategory.toString()}', width: 65),
        Text(
          nameCategory.toString(),
          style: mediumTextStyle.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
