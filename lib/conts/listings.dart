import 'package:find_my_rent/screens/listingslargeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallListing extends StatefulWidget {
  const SmallListing({super.key});

  @override
  State<SmallListing> createState() => _SmallListingState();
}

class _SmallListingState extends State<SmallListing> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Listingslargeview()),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 205.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                'assets/images/propertyimage.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 10.w,
            top: 10.h,
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(4.sp),
                child: Image.asset(
                  'assets/icons/likesicon.png',
                  color: Theme.of(context).colorScheme.surface,
                  width: 10.w,
                  height: 10.h,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 10.w,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.8),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Property Name",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Clarendon',
                            height: 0.8.h,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.surface,
                          )),
                      Text("City Name",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Clarendon',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.surface,
                          )),
                      Text("N\$3000/month",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Clarendon',
                            fontWeight: FontWeight.bold,
                            height: 0.8.h,
                            color: Theme.of(context).colorScheme.surface,
                          )),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: Theme.of(context).colorScheme.surface,
                              size: 14.sp),
                          SizedBox(width: 4.w),
                          Text("4.5",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'Clarendon',
                                color: Theme.of(context).colorScheme.surface,
                              )),
                        ],
                      ),
                    ])),
          ),
        ],
      ),
    );
  }
}
