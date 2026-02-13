import 'package:find_my_rent/conts/listings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 20.h),

            //Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.surface, width: 2),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Text("Searched Placed Here",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface,
                      )),
                ),
              ),
            ),

            //Filter Options Button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text("Filter Search",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  )),
            ),
            SizedBox(height: 20.h),

            //Search Results
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text('Showing "Searched Place Here" Results',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: 'Clarendon',
                      height: 0.8.h,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    )),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: SizedBox(
                height: 690.h,
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
        )),
      ),
    );
  }
}
