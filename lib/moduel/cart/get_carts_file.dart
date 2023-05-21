import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/model/cart_item.dart';
import 'package:azaiim/model/get_cart.dart';
import 'package:azaiim/model/get_carts.dart';

Widget getCarts(DataCarts cart, BuildContext context) {
  // double price = double.parse(items.price);
  //  var totalPrice =task['price'] * HomeCubit.get(context).quantity;
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      // border: Border.all(width: .2),
      borderRadius: BorderRadius.circular(20),
    ),
    height: 140.h,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 140.w,
                  child: Wrap(
                    children: [
                      Text(
                        '${cart.productName}',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'GE_SS_Two',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    defaultText(txt: '  د.ك   '),
                    Text(
                      '${cart.lineSubtotal}',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Column(
                  children: [
                    defaultText(
                        txt: 'اختر الكمية',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // HomeCubit.get(context).increaseCarts(cart);
                          },
                          child: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(7),
                              // border: Border.all(width: .2),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Container(
                            height: 30.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(width: .2),
                            ),
                            child: Center(
                                child: Text(
                              '${cart.qty}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ))),
                        SizedBox(
                          width: 15.w,
                        ),
                        InkWell(
                          onTap: () {
                            HomeCubit.get(context).decreaseCarts(cart);
                          },
                          child: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(7),
                              // border: Border.all(width: .2),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${cart.thumbnail}',
                        ))),
              ),
              InkWell(
                onTap: () {
                  // HomeCubit.get(context)
                  //     .AddTOCartss(quantity: 0, productId: cart.productId);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  maxRadius: 13,
                  child: Icon(
                    Icons.clear_sharp,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
