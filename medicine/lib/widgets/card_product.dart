import 'package:flutter/material.dart';
import 'package:medicine/theme.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    this.imageProduct,
    this.nameProduct,
    this.price,
  });

  final String? imageProduct;
  final String? nameProduct;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Image.network(imageProduct.toString(), width: 115, height: 76),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              nameProduct.toString(),
              style: regulerTextStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 14),
          Text(price.toString(), style: boldTextStyle),
        ],
      ),
    );
  }
}
