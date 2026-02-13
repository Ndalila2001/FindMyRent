import 'package:find_my_rent/screens/messageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text("Messages",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: 'Clarendon',
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    )),
              ),

              SizedBox(height: 20.h),
              SizedBox(
                height: 640.h,
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // change to 2 if you want 2 per row
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    mainAxisExtent: 80.h, // match container height
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        final heroTag = 'message-card-$index';
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (_, __, ___) =>
                                Messageview(heroTag: heroTag),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'message-card-$index',
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.surface,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10.w),
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.surface,
                                  radius: 30.r,
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "John Doe",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: 'Clarendon',
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                      ),
                                      Text(
                                        "Property Name Here (N\$3000/month)",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'Clarendon',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                      ),
                                      Text(
                                        "Hey, I'm interested in the property!",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'Poppins',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
