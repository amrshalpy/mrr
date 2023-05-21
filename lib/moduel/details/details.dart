import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:rate_in_stars/rate_in_stars.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/model/product_model.dart';
import 'package:azaiim/moduel/cart/cart.dart';
import 'package:azaiim/moduel/cart/cart_screen.dart';
import 'package:azaiim/moduel/feeds/get_products.dart';
import 'package:azaiim/moduel/home/home.dart';
import 'package:azaiim/moduel/web_view/web_view%20copy.dart';
import 'package:azaiim/moduel/web_view/web_view.dart';

class Details extends StatelessWidget {
  ProductModel? productModel;
  String? img;
  int? id;
  String? name;
  double? price;
  String? desc;
  Details(
      {this.img, this.id, this.name, this.price, this.productModel, this.desc});

  @override
  Widget build(BuildContext context) {
    Future<bool> popScreen() async {
      nextPageUntil(context: context, page: Home());
      return false;
    }

    return BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
      if (state is AddCartssSucsses) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: defaultText(
            txt: 'لقد اضفت المنتج بنجاح',
            color: Colors.white,
          ),
          duration: Duration(seconds: 1),
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ));
      }
    }, builder: (context, state) {
      HomeCubit cubit = HomeCubit.get(context);
      return WillPopScope(
        onWillPop: popScreen,
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                // alignment: Alignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 280.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(img!), fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.h, right: 15.w),
                        child: BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              nextPage(
                                  context: context,
                                  page:Carts());
                            },
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      height: 40.h,
                                      width: 50.w,
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                HomeCubit.get(context).cartMap.length != 0
                                    ? CircleAvatar(
                                        backgroundColor: Colors.brown.shade300,
                                        maxRadius: 13,
                                        child: Center(
                                          child: defaultText(
                                              txt:
                                                  '${HomeCubit.get(context).cartMap.length}',
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 260.h),
                    child: Container(
                      height: 700.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(width: .2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultText(
                              txt: name,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        defaultText(
                                            txt: '  د.ك',
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.normal),
                                        Text(
                                          '${price}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 23.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30.w,
                                    ),
                                    Row(
                                      children: [
                                        RatingStars(
                                          editable: true,
                                          rating: 3.5,
                                          color: Colors.amber,
                                          iconSize: 24,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            defaultText(txt: 'الوصف'),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            desc != ""
                                ? HtmlWidget(
                                    desc!,
                                    textStyle: TextStyle(color: Colors.black),
                                  )
                                : SizedBox(),
                            // Column(
                            //   children: [
                            //     defaultText(txt: 'اختر الكمية'),
                            //     SizedBox(
                            //       height: 10.h,
                            //     ),
                            //     BlocConsumer<HomeCubit,HomeState>(
                            //       listener: (context, state) {},
                            //       builder: (context, state) {
                            //       return Row(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           InkWell(
                            //             onTap: () {
                            //               // HomeCubit.get(context)
                            //               //     .inCrease(productModel!);
                            //             },
                            //             child: Container(
                            //               height: 30.h,
                            //               width: 30.w,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.amber,
                            //                 borderRadius:
                            //                     BorderRadius.circular(7),
                            //                 border: Border.all(width: .2),
                            //               ),
                            //               child: Icon(
                            //                 Icons.add,
                            //                 color: Colors.white,
                            //               ),
                            //             ),
                            //           ),
                            //           SizedBox(
                            //             width: 15.w,
                            //           ),
                            //           Container(
                            //             height: 30.h,
                            //             width: 50.w,
                            //             decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(7),
                            //               border: Border.all(width: .2),
                            //             ),
                            //             child: Center(
                            //                 child: defaultText(
                            //                     txt:
                            //                         '${HomeCubit.get(context).quantity}',
                            //                     color: Colors.black)),
                            //           ),
                            //           SizedBox(
                            //             width: 15.w,
                            //           ),
                            //           InkWell(
                            //             onTap: () {
                            //               // HomeCubit.get(context)
                            //               //     .deCrease(productModel);
                            //             },
                            //             child: Container(
                            //               height: 30.h,
                            //               width: 30.w,
                            //               decoration: BoxDecoration(
                            //                 color: Colors.amber,
                            //                 borderRadius:
                            //                     BorderRadius.circular(7),
                            //                 border: Border.all(width: .2),
                            //               ),
                            //               child: Icon(
                            //                 Icons.remove,
                            //                 color: Colors.white,
                            //               ),
                            //             ),
                            //           )
                            //         ],
                            //       );
                            //     }),
                            //   ],
                            // ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: mainColor),
                                    onPressed: () {
                                      HomeCubit.get(context)
                                          .addCarts(productModel!);
                                      cubit.AddTOCartss(
                                        productId: cubit.productId,
                                        quantity: 1,
                                      );
                                    },
                                    child: defaultText(
                                        txt: 'اضف الي السلة',
                                        color: Colors.white)),
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blueGrey.shade50),
                                height: 300.h,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w, left: 10.w, top: 20.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          defaultText(
                                              txt: ' اصناف مشابهه ',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                          // defaultText(
                                          //     txt: ' عرض المزيد ',
                                          //     fontSize: 13.sp,
                                          //     fontWeight: FontWeight.normal),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    cubit.products != null
                                        ? Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Colors.blueGrey.shade50),
                                            height: 250.h,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 10.w, left: 10.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // SizedBox(
                                                  //   height: 10.h,
                                                  // ),
                                                  cubit.products.isNotEmpty
                                                      ? Container(
                                                          height: 220.h,
                                                          child: ListView
                                                              .separated(
                                                                  separatorBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          SizedBox(
                                                                            width:
                                                                                10.w,
                                                                          ),
                                                                  shrinkWrap:
                                                                      true,
                                                                  // physics: BouncingScrollPhysics(),
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemBuilder: (context,
                                                                          index) =>
                                                                      getProducts(
                                                                          cubit.products[
                                                                              index],
                                                                          context,
                                                                          state),
                                                                  itemCount: cubit
                                                                      .products
                                                                      .length),
                                                        )
                                                      : Center(
                                                          child:
                                                              CupertinoActivityIndicator()),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Center(
                                            child: CupertinoActivityIndicator())
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      );
    });
  }
}
