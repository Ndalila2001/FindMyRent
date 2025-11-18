// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:find_my_rent/screens/tenant_user/signup_tenant.dart';
import 'package:find_my_rent/screens/tenant_user/tenant_hompage.dart';
import 'package:find_my_rent/services/api_service.dart';
import 'package:flutter/material.dart';
import 'dart:ui';


class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   LoginPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/login_background.jpg', fit: BoxFit.cover),
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
                  // Logo 
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 15,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        ),
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
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal:30),
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
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black,
                     ),
                  ),

                  const SizedBox(height: 20),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address or Phone Number",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),
                  
                  //email/phone number text field
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Email Address or Phone Number",
                      hintStyle: const TextStyle(fontFamily: 'Poppins'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       ),
                       contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                       ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  
                  //password text field
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(fontFamily: 'Poppins'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                  
                  //login button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        final username = usernameController.text.trim();
                        final password = passwordController.text.trim();

                        if (username.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter your username and password"),
                          backgroundColor: Colors.red,
                          ));
                          return;
                        }
                        try {
                          final response = await ApiService.login(
                            username: username,
                            password: password,
                          );
                          

                          print("log in successful: $response");

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context)=>  const TenantHomePage()),
                          );
                        } catch (e) {
                          print("log in failed: $e");

                        ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                 content: Text("Login failed: ${e.toString()}"),
                                 backgroundColor: Colors.red,
                                ),
                           );  
                        }
                      },
                      style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                       ),
                     ),
                     child: const Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                     ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't Have an Account?",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 5),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TenantSignUpPage())
                          );
                        },
                        child: const Text(
                          "Create an Account",
                          style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                   ]
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