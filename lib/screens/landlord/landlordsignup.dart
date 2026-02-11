// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:find_my_rent/conts/buttons.dart';
import 'package:find_my_rent/conts/textfields.dart';
import 'package:find_my_rent/screens/landlord/landlordemailconfirm.dart';
import 'package:find_my_rent/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignupPage({super.key});

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
                                controller: TextEditingController(),
                                hintText: 'First Name',
                              ),
                            ),
                            SizedBox(width: 5.w),
                            SizedBox(
                              width: 175.w,
                              child: ShortUserNameField(
                                controller: TextEditingController(),
                                hintText: 'Last Name',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        EmailTextField(
                            controller: TextEditingController(),
                            hintText: "Email Address"),
                        SizedBox(height: 10.h),
                        PhoneNumber(
                            controller: TextEditingController(),
                            hintText: "Phone Number"),
                        SizedBox(height: 10.h),
                        PasswordTextField(
                            controller: TextEditingController(),
                            hintText: "Password"),
                        SizedBox(height: 10.h),
                        PasswordTextField(
                            controller: TextEditingController(),
                            hintText: "Confirm Password"),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 175.w,
                              child: DateOfBirthField(
                                controller: TextEditingController(),
                              ),
                            ),
                            SizedBox(
                              width: 175.w,
                              child: CustomDropdown(
                                options: const ["Male", "Female", "Other"],
                                controller: TextEditingController(),
                                hintText: 'Gender',
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 40.h),
                        MainButton1(
                            text: "Next",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LandlordEmailConfirm()));
                            }),
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
