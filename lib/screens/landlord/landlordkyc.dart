import 'dart:ui';
import 'package:find_my_rent/conts/errormessage.dart';
import 'package:find_my_rent/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Landlordkyc extends StatefulWidget {
  final String accessToken;

  const Landlordkyc({super.key, required this.accessToken});

  @override
  State<Landlordkyc> createState() => _LandlordkycState();
}

class _LandlordkycState extends State<Landlordkyc> {
  late WebViewController _webViewController;
  bool isLoading = true;
  String? verificationUrl;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _createKycSession();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Error',
        message: message,
      ),
    );
  }

  Future<void> _createKycSession() async {
    try {
      final response = await ApiService.createKycSession(widget.accessToken);

      setState(() {
        verificationUrl = response['url'];
        isLoading = false;
      });

      if (verificationUrl != null) {
        _initializeWebView();
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      });
      _showErrorDialog(errorMessage!);
    }
  }

  void _initializeWebView() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading progress if needed
          },
          onPageStarted: (String url) {
            // Page started loading
          },
          onPageFinished: (String url) {
            // Page finished loading
          },
          onWebResourceError: (WebResourceError error) {
            _showErrorDialog(
                'Failed to load verification page: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(verificationUrl!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/login_background.jpg',
                fit: BoxFit.cover),
          ),
          SizedBox.expand(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 400.w,
                    height: 700.h,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "WE NEED TO VERIFY YOUR IDENTITY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Clarendon',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 600.h,
                          width: 400.w,
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                )
                              : verificationUrl != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: WebViewWidget(
                                        controller: _webViewController,
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        errorMessage ??
                                            'Unable to load verification',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.sp,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
