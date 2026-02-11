// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:find_my_rent/conts/buttons.dart';
import 'package:find_my_rent/conts/errormessage.dart';
import 'package:find_my_rent/conts/textfields.dart';
import 'package:find_my_rent/screens/landlord/landlordemailconfirm.dart';
import 'package:find_my_rent/screens/login_page.dart';
import 'package:find_my_rent/services/api_service.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();

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

  void _handleSignup() async {
    // Validation
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        dobController.text.isEmpty ||
        genderController.text.isEmpty) {
      _showErrorDialog('Please fill in all fields');
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _showErrorDialog('Passwords do not match');
      return;
    }

    if (passwordController.text.length < 8) {
      _showErrorDialog('Password must be at least 8 characters');
      return;
    }

    setState(() {
      isLoading = true;
    });

    _showLoadingDialog();

    try {
      await ApiService.createUser(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phoneNumber: phoneController.text,
        password: passwordController.text,
        verifyPassword: confirmPasswordController.text,
        dateOfBirth: dobController.text,
        gender: genderController.text,
      );

      if (mounted) {
        Navigator.pop(context); // Close loading dialog
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandlordEmailConfirm(
              email: emailController.text,
              password: passwordController.text,
            ),
          ),
        );
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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dobController.dispose();
    genderController.dispose();
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
                          "SIGNUP",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 175.w,
                              child: ShortUserNameField(
                                controller: firstNameController,
                                hintText: 'First Name',
                              ),
                            ),
                            SizedBox(width: 5.w),
                            SizedBox(
                              width: 175.w,
                              child: ShortUserNameField(
                                controller: lastNameController,
                                hintText: 'Last Name',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        EmailTextField(
                            controller: emailController,
                            hintText: "Email Address"),
                        SizedBox(height: 10.h),
                        PhoneNumber(
                            controller: phoneController,
                            hintText: "Phone Number"),
                        SizedBox(height: 10.h),
                        PasswordTextField(
                            controller: passwordController,
                            hintText: "Password"),
                        SizedBox(height: 10.h),
                        PasswordTextField(
                            controller: confirmPasswordController,
                            hintText: "Confirm Password"),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 175.w,
                              child: DateOfBirthField(
                                controller: dobController,
                              ),
                            ),
                            SizedBox(
                              width: 175.w,
                              child: CustomDropdown(
                                options: const ["Male", "Female", "Other"],
                                controller: genderController,
                                hintText: 'Gender',
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 40.h),
                        MainButton1(
                            text: "Next",
                            onTap: isLoading ? () {} : _handleSignup),
                        SizedBox(height: 20.h),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already Have an Account?",
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
                                          builder: (context) => LoginPage()));
                                },
                                child: Text(
                                  "Login",
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
