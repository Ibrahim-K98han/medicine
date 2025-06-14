import 'package:flutter/material.dart';
import 'package:medicine/pages/login_screen.dart';
import 'package:medicine/widgets/button_primary.dart';
import 'package:medicine/widgets/general_logo_space.dart';
import 'package:medicine/widgets/widget_ilustration.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralLogoSpace(
        child: Column(
          children: [
            SizedBox(height: 40),
            WidgetIlustration(
              image: 'assets/images/splash_ilustration.png',
              title: 'Find your medical \nsolution',
              subtitle1: 'Consult with a doctor',
              subtitle2: 'whereever and whenever you want',
              child: ButtonPrimary(
                text: 'GET STARTED',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
