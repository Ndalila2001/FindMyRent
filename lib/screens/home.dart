import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                    color: Theme.of(context).colorScheme.surface, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search for properties",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context)
                            .colorScheme
                            .surface
                            .withOpacity(0.5),
                      )),
                  SizedBox(width: 10.w),
                  Icon(Icons.search,
                      color: Theme.of(context).colorScheme.surface),
                ],
              ),
            ),

            //Categories List
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 4.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text("Category 1",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text("Category 1",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text("Category 1",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
                ),
              ],
            ),

            SizedBox(height: 10.h),
            //Nearby Properties List
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text("Showing Nearby Properties",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: 'Clarendon',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
