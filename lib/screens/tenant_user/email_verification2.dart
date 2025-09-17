// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:find_my_rent/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //success animation
              Lottie.asset(
                "assets/animations/success.json",
                height: 120,
                repeat: true,
              ),
              
              const SizedBox(height: 5),

              const Text(
                "Your account has successfully been created!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),
            
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage())
                    ); 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class EmailVerificationPage extends StatefulWidget {
  final String sentCode; // the code sent to the user's email

  const EmailVerificationPage({super.key, required this.sentCode});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  String enteredCode = "";
  String? errorMessage;

  void _verifyCode() {
    if (enteredCode == widget.sentCode) {
    showSuccessDialog(context);
  } else {
    setState(() {
      errorMessage = "Invalid code. Please try again.";
    });
  }   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          
          Image.asset(
            "assets/images/login_background.jpg",
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0)),
          ),

          
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Logo
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 70,
                      width: 70,
                    ),
                  ),

                  const SizedBox(height: 20),

                  
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Verify Your Email or Phone Number",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Enter the 6-digit code sent to your email address or phone number.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),

                      
                        PinCodeTextField(
                          appContext: context,
                          length: 4, 
                          obscureText: false,
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            selectedFillColor: Colors.grey.shade200,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            selectedColor: Colors.green,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          onChanged: (value) {
                            setState(() {
                              enteredCode = value;
                            });
                          },
                        ),

                        if (errorMessage != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ],

                        const SizedBox(height: 20),

                        // verify button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _verifyCode,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              "Verify",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: const Text(
                            "Didn’t receive a code? Resend",
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
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
    );
  }
}
