import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicine/main_screen.dart';
import 'package:medicine/network/api/url_api.dart';
import 'package:medicine/network/model/pref_profile.dart';
import 'package:medicine/pages/register_screen.dart';
import 'package:medicine/theme.dart';
import 'package:medicine/widgets/button_primary.dart';
import 'package:medicine/widgets/general_logo_space.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  submitLogin() async {
    var registerUrl = Uri.parse(BASEURL.apiLogin);
    final response = await http.post(
      registerUrl,
      body: {
        "email": emailController.text,
        "password": passwordController.text,
      },
    );
    final data = jsonDecode(response.body);
    print(response.body);
    int value = data['value'];
    String message = data['message'];
    String idUser = data['user_id'];
    String name = data['name'];
    String email = data['email'];
    String phone = data['phone'];
    String address = data['address'];
    String createdAt = data['created_at'];

    if (value == 1) {
      savePref(idUser, name, email, phone, address, createdAt);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Information'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                    (route) => false,
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      setState(() {});
    } else {
      showDialog(
        barrierDismissible: false,
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

  savePref(
    String idUser,
    String name,
    String email,
    String phone,
    String address,
    String createdAt,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(PrefProfile.idUser, idUser);
    sharedPreferences.setString(PrefProfile.name, name);
    sharedPreferences.setString(PrefProfile.email, email);
    sharedPreferences.setString(PrefProfile.phone, phone);
    sharedPreferences.setString(PrefProfile.address, address);
    sharedPreferences.setString(PrefProfile.createdAt, createdAt);
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
                SizedBox(height: 80),
                Text(
                  'login'.toUpperCase(),
                  style: regulerTextStyle.copyWith(fontSize: 25),
                ),
                SizedBox(height: 8),
                Text(
                  'Login to your account',
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
                    text: 'login'.toUpperCase(),
                    onTap: () {
                      if (emailController.text.isEmpty ||
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
                        submitLogin();
                      }
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: lightTextStyle.copyWith(
                        color: greyLightColor,
                        fontSize: 15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Create account',
                        style: boldTextStyle.copyWith(
                          color: greenColor,
                          fontSize: 15,
                        ),
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
