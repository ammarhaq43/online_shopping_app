import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';
import 'login_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF2b1615),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.lightBlue,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.30, top: screenHeight * 0.08),
                    child: Image.asset(
                      "assets/images/Cart Nest.png",
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.2,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.03, left: screenWidth * 0.02),
                    margin: EdgeInsets.only(top: screenHeight / 3.5),
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
                              "Signup",
                              style: GoogleFonts.exo(
                                color: Colors.black,
                                fontSize: screenWidth * 0.08,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTextFormField(
                                        controller: _firstNameController,
                                        hintText: "First Name",
                                        icon: Icons.person,
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.03),
                                    Expanded(
                                      child: _buildTextFormField(
                                        controller: _lastNameController,
                                        hintText: "Last Name",
                                        icon: Icons.person,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                _buildTextFormField(
                                  controller: _emailController,
                                  hintText: "Email",
                                  icon: Icons.email,
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                _buildTextFormField(
                                  controller: _passwordController,
                                  hintText: "Password",
                                  icon: Icons.lock,
                                  isPassword: true,
                                ),
                                SizedBox(height: screenHeight * 0.03),
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
                                        _signUp();
                                      }
                                    },
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.055,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Row(
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
                                ),
                                SizedBox(height: screenHeight * 0.02),
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
                                SizedBox(height: screenHeight * 0.04),
                                Padding(
                                  padding: EdgeInsets.only(left: screenWidth * 0.09),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.040,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          " Login",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF2b1615),
                                            fontSize: screenWidth * 0.040,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      obscureText: isPassword && !isPasswordVisible,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(22),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        suffixIcon: isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your $hintText";
        }
        return null;
      },
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

  void _signUp() async {
    setState(() {
      _isLoading = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print("User is successfully created");
      setState(() {
        _isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      print("Some error occurred");
    }
  }
}
