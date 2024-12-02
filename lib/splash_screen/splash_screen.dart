import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_shopping_app/login_and_signup_screens/signup_screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Start navigating to the SignupPage after 4 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignupPage()),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background container with the app icon
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.lightBlue, // Background color
            child: Center(
              child: Image.asset(
                'assets/images/app_icon_without_background.png',
                fit: BoxFit.cover,
                width: 330,
                height: 220,
              ),
            ),
          ),
          // CircularProgressIndicator at the bottom of the screen
          Positioned(
            bottom: 40.0, // Adjust position from the bottom
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
