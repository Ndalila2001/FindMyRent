import 'package:find_my_rent/conts/themes.dart';
import 'package:find_my_rent/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Find My Rent',
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
      ),
    );
  }
}
