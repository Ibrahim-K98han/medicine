import 'package:flutter/material.dart';
import 'package:medicine/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/logo.png', width: 155),
                    SizedBox(height: 16),
                    Text(
                      'Find a medicine or\nvitamins with MEDHEALTH!',
                      style: regulerTextStyle.copyWith(
                        fontSize: 15,
                        color: greyBoldColor,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart, color: greenColor),
                ),
              ],
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffe4faf0),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Color(0xffb1d8b2)),
                  hintText: 'Search Medicine...',
                  hintStyle: regulerTextStyle.copyWith(
                    color: Color(0xffb0d8b2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Medicine & Vitamins by Category',
              style: regulerTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
