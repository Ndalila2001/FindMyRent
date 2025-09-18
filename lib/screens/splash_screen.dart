// ignore_for_file: use_build_context_synchronously

import 'package:find_my_rent/screens/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // logo and loading indicator
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 90,
                    width: 90,
                  ),
                  const SizedBox(height: 30),
                  const CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: 3,
                  ),
                ],
              ),
            ),
          ),

          // groundshaker logo
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                const Text(
                  "BY",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Image.asset(
                  "assets/images/groundshakers logo.png",
                  height: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
