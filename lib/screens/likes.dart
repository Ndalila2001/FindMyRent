import 'package:find_my_rent/conts/listings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          //Location Icon and Name
          Column(
            children: [
              Image.asset(
                'assets/icons/location.png',
                color: Theme.of(context).colorScheme.surface,
                width: 50.w,
                height: 50.h,
              ),
              SizedBox(height: 4.h),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Text("Location Name Here",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text("Showing Liked Properties",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: 'Clarendon',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.surface,
                  )),
            ),
          ),

          SizedBox(height: 10.h),
          Center(
            child: SizedBox(
              height: 650.h,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 205.h, // exact height of each card
                ),
                itemBuilder: (context, index) {
                  return const SmallListing();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
