import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/model/cart_item.dart';
import 'package:azaiim/moduel/cart/get_carts.dart';
import 'package:azaiim/moduel/cart/get_carts_file.dart';
import 'package:azaiim/moduel/web_view/web_view.dart';

class CartsScreen extends StatefulWidget {
  CartsScreen({Key? key}) : super(key: key);

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  GetCarts? carts;
  int? index1;
  double? totalPrice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _fetchCartItems();
  }

  // List<CartItem> cartItemss = [];
  // void _fetchCartItems() async {
  //   List<Map<String, dynamic>> cartItems =
  //       await DatabaseHelper.instance.getCartMapList();
  //   setState(() {
  //     cartItemss = cartItems.cast<CartItem>();
  //     print(cartItemss);
  //   });
  // }

  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // if (state is AddCartsSucsses) {
        //   nextPage(
        //       context: context,
        //       page: WebViewScreen(
        //         url: '${HomeCubit.get(context).productIdss}',
        //       ));
        // }
      },
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        // totalPrice = double.tryParse(cubit.getCarts!.totals!.subtotal);
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: cubit.cartMap != null
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey.shade200,
                    child: Column(children: [
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
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.h, left: 10.w),
                        child: Column(
                          children: [
                            Container(
                              height: 500.h,
                              width: double.infinity,
                              child: cubit.cartMap.isNotEmpty
                                  ? ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                      itemCount: cubit.cartMap.length,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        index1 = index;

                                        return GetCarts(
                                          index: index,
                                          productModel: cubit.cartMap.keys
                                              .toList()[index],
                                          quantity: cubit.cartMap.values
                                              .toList()[index],
                                        );
                                      })
                                  : Center(
                                      child:
                                          defaultText(txt: 'عربة التسوق فارغة'),
                                    ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (cubit.cartMap.length != 0)
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      defaultText(
                                          txt: 'Total Price',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                      Row(
                                        children: [
                                          defaultText(
                                              txt: '  د.ك',
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.normal),
                                          Text(
                                            '${HomeCubit.get(context).totalPrice}',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Container(
                                    height: 40.h,
                                    width: 150.w,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            primary: mainColor),
                                        onPressed: () {
                                          cubit.AddTOCartss(
                                            productId: cubit.productId,
                                            quantity: cubit.cartMap.values
                                                .toList()[index1!],
                                          );
                                          print(cubit.productId);
                                          Timer(Duration(seconds: 2), () {
                                            nextPage(
                                                context: context,
                                                page: WebViewScreen(
                                                  url: '${cubit.productId}',
                                                ));
                                          });
                                        },
                                        child: defaultText(
                                            txt: 'اتمام الطلب',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 17.sp)),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                      ),
                    ]),
                  )
                : Center(child: CupertinoActivityIndicator()),
          ),
        );
      },
    );
  }
}
