import 'dart:ui';

import 'package:find_my_rent/conts/buttons.dart';
import 'package:find_my_rent/conts/errormessage.dart';
import 'package:find_my_rent/conts/textfields.dart';
import 'package:find_my_rent/screens/landlord/landlordkyc.dart';
import 'package:find_my_rent/services/api_service.dart';
import 'package:find_my_rent/services/auth_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandlordEmailConfirm extends StatefulWidget {
  final String email;
  final String password;

  const LandlordEmailConfirm(
      {super.key, required this.email, required this.password});

  @override
  State<LandlordEmailConfirm> createState() => _LandlordEmailConfirmState();
}

class _LandlordEmailConfirmState extends State<LandlordEmailConfirm> {
  final codeController = TextEditingController();
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

  void _handleConfirm() async {
    if (codeController.text.isEmpty) {
      _showErrorDialog('Please enter the verification code');
      return;
    }

    setState(() {
      isLoading = true;
    });

    _showLoadingDialog();

    try {
      await ApiService.verifyEmailCode(
        email: widget.email,
        code: codeController.text,
      );

      if (mounted) {
        // Auto-login after verification
        final loginResponse = await ApiService.login(
          username: widget.email,
          password: widget.password,
        );

        final accessToken = loginResponse['access_token'];
        final refreshToken = loginResponse['refresh_token'];

        // Store tokens securely
        await AuthStorage.saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );

        Navigator.pop(context); // Close loading dialog
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Landlordkyc(accessToken: accessToken),
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

  void _handleResend() async {
    setState(() {
      isLoading = true;
    });

    _showLoadingDialog();

    try {
      await ApiService.sendVerificationCode(widget.email);
      if (mounted) {
        Navigator.pop(context); // Close loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification code resent')),
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
    codeController.dispose();
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
                          "CONFIRM ACCOUNT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Clarendon',
                            fontWeight: FontWeight.bold,
                            fontSize: 34.sp,
                            height: 0.8.h,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Enter the 6-digit code sent to",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Clarendon',
                            fontSize: 18.sp,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                        Text(
                          widget.email,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Clarendon',
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        CodeTextField(
                          controller: codeController,
                        ),
                        SizedBox(height: 40.h),
                        MainButton1(
                            text: "Confirm",
                            onTap: isLoading ? () {} : _handleConfirm),
                        SizedBox(height: 20.h),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn't receive the code?",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              GestureDetector(
                                onTap: isLoading ? null : _handleResend,
                                child: Text(
                                  "Resend",
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
