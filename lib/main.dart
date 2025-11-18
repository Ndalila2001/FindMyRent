import 'package:find_my_rent/screens/splash_screen.dart';
import 'package:find_my_rent/screens/tenant_user/likespage.dart';
import 'package:find_my_rent/screens/tenant_user/messagespage.dart';
import 'package:find_my_rent/screens/tenant_user/profilepage.dart';
import 'package:find_my_rent/screens/tenant_user/tenant_hompage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",

      routes: {
        "/splash": (context) => const SplashScreen(),
        "/home": (context) => const TenantHomePage(),
        "/likes": (context) => const LikesPage(),
        "/messages": (context) => const MessagesPage(),
        "/profile": (context) => const ProfilePage()
       
      },
    );
  }
}

