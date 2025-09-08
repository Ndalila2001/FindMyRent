// ignore_for_file: deprecated_member_use

import 'package:find_my_rent/screens/landlordagent_user/landlordagent_signup.dart';
import 'package:find_my_rent/screens/tenant_user/signup_tenant.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class AccountTypePage extends StatelessWidget {
  const AccountTypePage({super.key});


@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("assets/images/login_background.jpg", 
        fit: BoxFit.cover,
        ),

        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0),
          ),
        ),

        Center(
          child:Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal:30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text (
                  "What will you be using FindMyRent for?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute( builder: (context) => const LandlordSignUpPage()),
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Post Rental Listings",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      )

                    ),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TenantSignUpPage()),
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        ),
                    ),
                    child: const Text(
                      "Find a Place to Rent",
                      style: TextStyle(
                        fontFamily: 'Poppins'
                      )
                      ),
                  )
                )
              ]
            )
          ) 
          )
      ]
    )

  );
}
}




