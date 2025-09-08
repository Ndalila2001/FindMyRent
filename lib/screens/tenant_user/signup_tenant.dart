// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import '../reusable_widgets/custom_text_field.dart'; 

class TenantSignUpPage extends StatefulWidget {
  const TenantSignUpPage({super.key});

  @override
  State<TenantSignUpPage> createState() => _TenantSignUpPageState();
}

class _TenantSignUpPageState extends State<TenantSignUpPage> {
  final TextEditingController _dobController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.green, // header background
              onPrimary: Colors.white, // header text
              onSurface: Colors.black, // body text
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            "assets/images/login_background.jpg", 
            fit: BoxFit.cover,
          ),

          
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),



          
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                )
              ]
            ),
            child: Image.asset(
              'assets/images/logo.png', 
               height: 70,
              width: 70,
            )
          ),

          const SizedBox(height: 20),

          Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
          
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [ 
                    const Text(
                      "Create An Account",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    
                    const CustomTextField(hint: "Full Names"),
                    const SizedBox(height: 12),

                    const CustomTextField(hint: "Email Address or Phone Number"),
                    const SizedBox(height: 12),

                    const CustomTextField(hint: "Create Password", isPassword: true),
                    const SizedBox(height: 12),

                    const CustomTextField(hint: "Retype Password", isPassword: true),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(child: TextField(
                                controller: _dobController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: "Date of Birth",
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today_outlined,
                                        color: Colors.black),
                                    onPressed: () => _selectDate(context),
                                  ),
                                ),
                              ),
                              ),
                        const SizedBox(width: 8),
                        const Expanded(child: CustomTextField(hint: "Gender")),
                      ],
                    ),

                    const SizedBox(height: 20),

                   
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // sign up
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white, 
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already Have an Account? ",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                         )
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); 
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
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
