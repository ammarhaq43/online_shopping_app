import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define a factor for scaling UI elements
        double scaleFactor = constraints.maxWidth / 375.0; // Base width 375
        return Scaffold(
          backgroundColor: const Color(0xFF2b1615),
          body: SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight,
              color: Colors.lightBlue,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 120 * scaleFactor,
                      top: 70 * scaleFactor,
                    ),
                    child: Image.asset(
                      "assets/images/Cart Nest.png",
                      width: 140 * scaleFactor,
                      height: 160 * scaleFactor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 30 * scaleFactor,
                      left: 10 * scaleFactor,
                    ),
                    margin: EdgeInsets.only(
                      top: constraints.maxHeight / 3.5,
                    ),
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Forgot Password",
                              style: GoogleFonts.exo(
                                color: Colors.black,
                                fontSize: 24 * scaleFactor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 20 * scaleFactor),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20 * scaleFactor),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(22 * scaleFactor),
                                  borderSide:
                                  const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.grey),
                                  borderRadius:
                                  BorderRadius.circular(22 * scaleFactor),
                                ),
                                hintText: "Your Old Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15 * scaleFactor,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: 20 * scaleFactor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isOldPasswordVisible =
                                      !isOldPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    isOldPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                    size: 20 * scaleFactor,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your old password';
                                }
                                return null;
                              },
                              obscureText: !isOldPasswordVisible,
                            ),
                          ),
                          SizedBox(height: 20 * scaleFactor),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20 * scaleFactor),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(22 * scaleFactor),
                                  borderSide:
                                  const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.grey),
                                  borderRadius:
                                  BorderRadius.circular(22 * scaleFactor),
                                ),
                                hintText: "Your New Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15 * scaleFactor,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: 20 * scaleFactor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isNewPasswordVisible =
                                      !isNewPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    isNewPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                    size: 20 * scaleFactor,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a new password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              obscureText: !isNewPasswordVisible,
                            ),
                          ),
                          SizedBox(height: 20 * scaleFactor),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20 * scaleFactor),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(22 * scaleFactor),
                                  borderSide:
                                  const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.grey),
                                  borderRadius:
                                  BorderRadius.circular(22 * scaleFactor),
                                ),
                                hintText: "Confirm Your Password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15 * scaleFactor,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: 20 * scaleFactor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    isConfirmPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                    size: 20 * scaleFactor,
                                  ),
                                ),
                              ),
                              obscureText: !isConfirmPasswordVisible,
                            ),
                          ),
                          SizedBox(height: 30 * scaleFactor),
                          SizedBox(
                            width: constraints.maxWidth * 0.8,
                            height: 50 * scaleFactor,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(25 * scaleFactor),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const LoginPage(),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Reset Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22 * scaleFactor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
