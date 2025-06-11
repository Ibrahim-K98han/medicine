import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicine/network/api/url_api.dart';
import 'package:medicine/theme.dart';
import 'package:medicine/widgets/button_primary.dart';
import 'package:medicine/widgets/general_logo_space.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  registerSubmit() async {
    var registerUrl = Uri.parse(BASEURL.apiRegister);
    final response = await http.post(
      registerUrl,
      body: {
        "fullname": fullNameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "address": addressController.text,
        "password": passwordController.text,
      },
    );
    final data = jsonDecode(response.body);
    print(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Information'),
            content: Text(message),
            actions: [TextButton(onPressed: () {}, child: Text('OK'))],
          );
        },
      );
      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Information'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GeneralLogoSpace(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REGISTER',
                  style: regulerTextStyle.copyWith(fontSize: 25),
                ),
                SizedBox(height: 8),
                Text(
                  'Register now your account',
                  style: regulerTextStyle.copyWith(
                    fontSize: 15,
                    color: greyLightColor,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      hintText: 'Full Name',
                      hintStyle: lightTextStyle.copyWith(
                        fontSize: 15,
                        color: greyLightColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      hintText: 'Email Address',
                      hintStyle: lightTextStyle.copyWith(
                        fontSize: 15,
                        color: greyLightColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),

                      hintText: 'Phone',
                      hintStyle: lightTextStyle.copyWith(
                        fontSize: 15,
                        color: greyLightColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),

                      hintText: 'Home Address',
                      hintStyle: lightTextStyle.copyWith(
                        fontSize: 15,
                        color: greyLightColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _secureText,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon:
                            _secureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyLightColor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      hintText: 'Password',
                      hintStyle: lightTextStyle.copyWith(
                        fontSize: 15,
                        color: greyLightColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ButtonPrimary(
                    text: 'REGISTER',
                    onTap: () {
                      if (fullNameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          phoneController.text.isEmpty ||
                          addressController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Warning !!'),
                              content: Text('Please, Enter The Fields'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        registerSubmit();
                      }
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: lightTextStyle.copyWith(
                        color: greyLightColor,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Login now',
                      style: boldTextStyle.copyWith(
                        color: greenColor,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
