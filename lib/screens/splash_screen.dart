// ignore_for_file: use_build_context_synchronously
import 'package:find_my_rent/screens/landlord/landlordemailconfirm.dart';
import 'package:find_my_rent/screens/landlord/landlordkyc.dart';
import 'package:find_my_rent/screens/onboardingscreen.dart';
import 'package:find_my_rent/services/api_service.dart';
import 'package:find_my_rent/services/auth_storage.dart';
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
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    // Check if user has a stored access token
    final hasToken = await AuthStorage.hasAccessToken();

    if (!hasToken) {
      // No token, go to onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboardingscreen()),
      );
      return;
    }

    // Has token, get user profile to check verification status
    try {
      final accessToken = await AuthStorage.getAccessToken();
      final userProfile = await ApiService.getUserProfile(accessToken!);

      final isEmailVerified = userProfile['verified'] ?? false;
      final isKycVerified = userProfile['kyc_verified'] ?? false;

      if (!isEmailVerified) {
        // Email not verified, go to email confirmation
        // Note: You might want to store email during signup for this case
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LandlordEmailConfirm(
              email: userProfile['email'],
              password: '', // Can't recover password, user needs to login again
            ),
          ),
        );
      } else if (!isKycVerified) {
        // Email verified but KYC not done, go to KYC page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Landlordkyc(accessToken: accessToken),
          ),
        );
      } else {
        // Both verified, go to main app
        // TODO: Navigate to main app home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Onboardingscreen()),
        );
      }
    } catch (e) {
      // Token invalid or expired, clear and go to onboarding
      await AuthStorage.clearTokens();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboardingscreen()),
      );
    }
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
