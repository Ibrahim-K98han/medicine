import 'package:flutter/material.dart';

class GeneralLogoSpace extends StatelessWidget {
  const GeneralLogoSpace({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          Image.asset('assets/images/logo.png', width: 115),
          child ?? SizedBox(),
        ],
      ),
    );
  }
}
