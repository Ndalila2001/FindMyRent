import 'package:find_my_rent/screens/home.dart';
import 'package:find_my_rent/screens/likes.dart';
import 'package:find_my_rent/screens/messages.dart';
import 'package:find_my_rent/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homemanager extends StatefulWidget {
  const Homemanager({super.key});

  @override
  State<Homemanager> createState() => _HomemanagerState();
}

class _HomemanagerState extends State<Homemanager> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Likes(),
    const Messages(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                iconPath: 'assets/icons/homeicon.png',
                index: 0,
                title: "Home",
              ),
              _buildNavItem(
                iconPath: 'assets/icons/likesicon.png',
                index: 1,
                title: "Likes",
              ),
              _buildNavItem(
                iconPath: 'assets/icons/messagesicon.png',
                index: 2,
                title: "Messages",
              ),
              _buildNavItem(
                iconPath: 'assets/icons/profileicon.png',
                index: 3,
                title: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      {required String iconPath, required int index, required String title}) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 28.w,
            height: 28.h,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
            ),
          ),
          SizedBox(height: 2.h),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 3.h,
            width: isSelected ? 40.w : 0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
}
