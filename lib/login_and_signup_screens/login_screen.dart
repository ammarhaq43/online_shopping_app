import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/details/components/main_screen.dart';
import 'forgot_password_screen.dart';
import 'signup_screens.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;
          return SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.3,
                    top: screenHeight * 0.07,
                  ),
                  child: Image.asset(
                    "assets/images/Cart Nest.png",
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: screenHeight * 0.05),
                  margin: EdgeInsets.only(
                    top: screenHeight / 3.5,
                  ),
                  height: screenHeight,
                  width: screenWidth,
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
                            "Login",
                            style: GoogleFonts.exo(
                              color: Colors.black,
                              fontSize: screenWidth * 0.08,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05),
                          child: TextFormField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              hintText: "Email",
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: screenWidth * 0.035,
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05),
                          child: TextFormField(
                            controller: _passwordController,
                            style: const TextStyle(color: Colors.black),
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              hintText: "Password",
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: screenWidth * 0.035,
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters long";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.01,
                            right: screenWidth * 0.07,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const ForgotPasswordScreen()),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.03,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        SizedBox(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _signIn(context);
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.06,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        _buildDivider(screenWidth),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialLoginButton(
                              "assets/images/google.png",
                              Colors.black,
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            _buildSocialLoginButton(
                              "assets/images/facebook.png",
                              Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.2),
                          child: Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignupPage()),
                                  );
                                },
                                child: Text(
                                  " Register",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.04,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDivider(double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        Text(
          "Or",
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: screenWidth * 0.035,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButton(String asset, Color borderColor) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 1,
            color: borderColor.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          asset,
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  void _signIn(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await _auth.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
