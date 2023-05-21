import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  String? url;
  WebViewScreen({Key? key, this.url}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;
  String? _url;
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
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..gETCArts(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            return Scaffold(
              // appBar: AppBar(
              //   title: defaultText(txt: 'اتمام الطلب', color: Colors.white),
              //   elevation: 0,
              //   backgroundColor: mainColor,
              // ),
              body: 
                   Column(
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
                                      // Image.asset(
                                      //   'images/shopping-cart-32.png',
                                      //   height: 30.h,
                                      //   width: 30.w,
                                      // ),
                                      // SizedBox(
                                      //   width: 10.w,
                                      // ),
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
                            child: Container(
                                // height: MediaQuery.of(context).size.height*2,
                                child: WebViewWidget(controller: controller))),
                      ],
                    )
                 
            );
          }),
    );
  }
}
