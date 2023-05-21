import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWidget extends StatefulWidget {
  String? url;
  bool? hasData;

  MyWidget({this.hasData, this.url});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String? _url;
  late WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.url != null) {
      _url = widget.url;
    } else {
      _url = '${HomeCubit.get(context).productId}';
    }
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://azaiim.com/?add-to-cart=${_url}'));
  }

  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      HomeCubit cubit = HomeCubit.get(context);
      if (cubit.cartMap.isEmpty) {
        widget.hasData = true;
      } else {
        widget.hasData = false;
      }
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Visibility(
                  visible: widget.hasData!,
                  child: Column(
                    children: [
                      Container(
                        height: 90.h,
                        color: mainColor,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 40.h, right: 10.w, left: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/shopping-cart-32.png',
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    defaultText(
                                        txt: 'عربة التسوق',
                                        fontSize: 20.sp,
                                        color: Colors.white),
                                  ],
                                ),
                                Row(
                                  children: [
                                    defaultText(
                                        txt: '${cubit.cartMap.length}',
                                        fontSize: 20.sp,
                                        color: Colors.white),
                                    defaultText(
                                        txt: 'عدد الاصناف : ',
                                        fontSize: 16.sp,
                                        color: Colors.white),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 250.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultText(
                                txt: 'عربة التسوق فارغة', color: Colors.black)
                          ],
                        ),
                      )
                    ],
                  ),
                  replacement: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Container(
                          height: 90.h,
                          color: mainColor,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 40.h, right: 10.w, left: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: Colors.black,
                                          )),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      defaultText(
                                          txt: 'اتمام الطلب',
                                          fontSize: 20.sp,
                                          color: Colors.white),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: WebViewWidget(
                            controller: controller,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
