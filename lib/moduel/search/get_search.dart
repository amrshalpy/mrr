import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/model/product_model.dart';
import 'package:azaiim/moduel/details/details.dart';

Widget getSearch(ProductModel produ, context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      // border: Border.all(width: .2),
      borderRadius: BorderRadius.circular(20),
    ),
    height: 90.h,
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
                Text(
                  '${produ.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Row(
                  children: [
                    defaultText(txt: '  د.ك   '),
                    Text(
                     '${produ.price}',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 80.h,
            width: 100.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${produ.images[0].src}',
                    ))),
          ),
        ],
      ),
    ),
  );
}
