// ignore_for_file: use_build_context_synchronously
import 'package:find_my_rent/screens/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        MaterialPageRoute(builder: (context) => Onboardingscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //Logo and app name
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 120.h,
                    width: 120.w,
                  ),
                  Text(
                    "Find My Rent",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: 'Clarendon',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Groundshakers logo
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Column(
              children: [
                Text(
                  "BY",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'Clarendon',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2.h),
                Image.asset(
                  "assets/images/groundshakers logo.png",
                  // height: 80.h,
                  width: 100.w,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
