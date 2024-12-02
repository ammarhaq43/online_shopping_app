import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping_app/login_and_signup_screens/forgot_password_screen.dart';
import 'package:online_shopping_app/login_and_signup_screens/login_screen.dart';
import 'package:online_shopping_app/login_and_signup_screens/signup_screens.dart';
import 'package:online_shopping_app/screens/details/components/main_screen.dart';
import 'package:online_shopping_app/screens/home/components/checkout_page.dart';
import 'package:online_shopping_app/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'firebase_options.dart';
import 'models/cart_provider.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}