// ignore_for_file: deprecated_member_use, use_build_context_synchronously, avoid_print

import 'dart:ui';
import 'package:find_my_rent/screens/landlordagent_user/email_verification.dart';
//import 'package:find_my_rent/screens/login_page.dart';
//import 'package:find_my_rent/screens/tenant_user/email_verification2.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/custom_text_field.dart';
import '../../services/api_service.dart';


class TenantSignUpPage extends StatefulWidget {
  const TenantSignUpPage({super.key});

  @override
  State<TenantSignUpPage> createState() => _TenantSignUpPageState();
}

class _TenantSignUpPageState extends State<TenantSignUpPage> {
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  //final TextEditingController _phoneController = TextEditingController();

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
              primary: Colors.green, 
              onPrimary: Colors.white,
              onSurface: Colors.black, 
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

 Future<void> _registerTenant() async {
    final fullName = _fullNameController.text.trim();
  final email = _emailController.text.trim();
  final password = _passwordController.text.trim();
  final confirmPassword = _confirmPasswordController.text.trim();

  if (fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill in all fields')),
    );
    return;
  }

  if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Passwords do not match')),
    );
    return;
  }

  try {
    await ApiService.createUser(
      firstName: fullName.split(' ').first,
      lastName: fullName.split(' ').skip(1).join(' '),
      email: email,
      phoneNumber: email,
      password: password,
      verifyPassword: confirmPassword,
    );
   
     //await ApiService.sendVerificationCode(email);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification code sent to your email')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailVerificationPage(
          email: email,
          fullName: fullName,
          password: password,
          confirmPassword: confirmPassword, sentCode: '',
        ),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to send verification code: $e')),
    );
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

                    
                     CustomTextField(hint: "Full Names", controller: _fullNameController),
                    const SizedBox(height: 12),

                    CustomTextField(hint: "Email Address", controller: _emailController),
                    const SizedBox(height: 12),

                    CustomTextField(hint: "Create Password", isPassword: true, controller: _passwordController),
                    const SizedBox(height: 12),

                   CustomTextField(hint: "Retype Password", isPassword: true, controller: _confirmPasswordController),
                    const SizedBox(height: 12),
                   
                    CustomTextField(hint: "Gender", controller: _genderController),
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
                        //const Expanded(child: CustomTextField(hint: "Gender")),
                      ],
                    ),

                    const SizedBox(height: 20),

                   
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push (
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const EmailVerificationPage(sentCode: '')),
                          // );
                          _registerTenant();
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
