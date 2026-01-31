// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:find_my_rent/conts/buttons.dart';
import 'package:find_my_rent/screens/login_page.dart';
import 'package:find_my_rent/screens/tenant_user/signup_tenant.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboardingscreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Onboardingscreen({super.key});

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
                          "Find Your Next Rental, fast and hustle-free",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Clarendon',
                            fontWeight: FontWeight.bold,
                            fontSize: 28.sp,
                            height: 0.8.h,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 40.h),

                        Container(
                          height: 60.h,
                          width: 320.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surface
                                    .withOpacity(0.8),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Image.asset(
                                  "assets/images/google.png",
                                  height: 40.h,
                                  width: 40.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10.h),
                        Container(
                          height: 60.h,
                          width: 320.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surface
                                    .withOpacity(0.8),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Image.asset(
                                  "assets/images/apple.png",
                                  height: 40.h,
                                  width: 40.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  "Continue with Apple",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10.h),
                        Container(
                          height: 60.h,
                          width: 320.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surface
                                    .withOpacity(0.8),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Image.asset(
                                  "assets/images/facebook.png",
                                  height: 40.h,
                                  width: 40.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  "Continue with Facebook",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 40.h),

                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).colorScheme.surface,
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Or',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.surface),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(context).colorScheme.surface,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 40.h),

                        //Create Account button
                        MainButton1(
                            text: "Create An Account",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            }),
                        const SizedBox(height: 15),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: Theme.of(context).colorScheme.surface,
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
                                  "Login",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.sp,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ]),
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
