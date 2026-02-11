// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:find_my_rent/conts/buttons.dart';
import 'package:find_my_rent/conts/errormessage.dart';
import 'package:find_my_rent/conts/textfields.dart';
import 'package:find_my_rent/screens/landlord/landlordemailconfirm.dart';
import 'package:find_my_rent/screens/landlord/landlordkyc.dart';
import 'package:find_my_rent/screens/tenant_user/signup_tenant.dart';
import 'package:find_my_rent/services/api_service.dart';
import 'package:find_my_rent/services/auth_storage.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Error',
        message: message,
      ),
    );
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      _showErrorDialog('Please enter your email and password');
      return;
    }

    setState(() {
      isLoading = true;
    });

    _showLoadingDialog();

    try {
      final loginResponse = await ApiService.login(
        username: usernameController.text,
        password: passwordController.text,
      );

      final accessToken = loginResponse['access_token'];
      final refreshToken = loginResponse['refresh_token'];

      // Store tokens
      await AuthStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      // Get user profile to check verification status
      final userProfile = await ApiService.getUserProfile(accessToken);

      if (mounted) {
        Navigator.pop(context); // Close loading dialog

        final isEmailVerified = userProfile['verified'] ?? false;
        final isKycVerified = userProfile['kyc_verified'] ?? false;

        if (!isEmailVerified) {
          // Email not verified
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LandlordEmailConfirm(
                email: userProfile['email'],
                password: passwordController.text,
              ),
            ),
          );
        } else if (!isKycVerified) {
          // Email verified but KYC not done
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Landlordkyc(accessToken: accessToken),
            ),
          );
        } else {
          // Both verified, go to main app
          // TODO: Navigate to main app home page
          _showErrorDialog('Login successful! Welcome back.');
        }
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Close loading dialog
        _showErrorDialog(e.toString().replaceFirst('Exception: ', ''));
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/login_background.jpg',
                fit: BoxFit.cover),
          ),
          SizedBox.expand(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400.w,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Clarendon',
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                            height: 0.8.h,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        EmailTextField(
                            controller: usernameController,
                            hintText: "Email Address or Phone Number"),
                        SizedBox(height: 10.h),
                        PasswordTextField(
                            controller: passwordController,
                            hintText: "Password"),
                        SizedBox(height: 40.h),
                        MainButton1(
                            text: "Login",
                            onTap: isLoading ? () {} : _handleLogin),
                        SizedBox(height: 20.h),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't Have an Account?",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TenantSignUpPage()));
                                },
                                child: Text(
                                  "Create an Account",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.sp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(height: 40.h),
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
  }
}
