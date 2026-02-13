import 'package:find_my_rent/conts/buttons.dart';
import 'package:find_my_rent/conts/listings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        body: Column(
          children: [
            SizedBox(height: 20.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text("John Doe",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Clarendon',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Icon(
                    Icons.menu,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                )
              ],
            ),
            SizedBox(height: 40.h),
            //Profile Picture and Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80.r,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
                SizedBox(width: 40.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      "Number of Rentals: 0",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Clarendon',
                        height: 0.8.h,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    Text(
                      "Currently Renting: 0",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: 'Clarendon',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                        width: 200.w,
                        child: MainButton1(text: "Add Listing", onTap: () {}))
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text("All Active and Free Listings",
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
                height: 510.h,
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  itemCount: 2,
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
        ));
  }
}
