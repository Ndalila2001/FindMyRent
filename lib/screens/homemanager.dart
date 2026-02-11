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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                iconPath: 'assets/icons/homeicon.png',
                index: 0,
              ),
              _buildNavItem(
                iconPath: 'assets/icons/likesicon.png',
                index: 1,
              ),
              _buildNavItem(
                iconPath: 'assets/icons/messagesicon.png',
                index: 2,
              ),
              _buildNavItem(
                iconPath: 'assets/icons/profileicon.png',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required String iconPath, required int index}) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Image.asset(
          iconPath,
          width: 28.w,
          height: 28.h,
          color:
              isSelected ? Theme.of(context).colorScheme.primary : Colors.grey,
        ),
      ),
    );
  }
}
