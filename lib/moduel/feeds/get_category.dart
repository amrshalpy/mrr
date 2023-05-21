import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/const.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/model/category_model.dart';
import 'package:azaiim/moduel/product_categories/product_categories.dart';

Widget getCategory(CategoryModel categori, context) {
  return Container(
    height: 70.h,
    width: 70.w,
    child: Column(
      children: [
        Container(
            height: 70.h,
            width: 70.w,
            // decoration: BoxDecoration(
            //     shape: BoxShape.circle, color: Colors.blueGrey.shade100),
            child: Container(
              // height: 50.h,
              // width: 50.w,
              decoration: BoxDecoration(
                  image: categori.image != null
                      ? DecorationImage(
                          image: NetworkImage('${categori.image!.src}'))
                      : DecorationImage(
                          image:
                              AssetImage('images/icons8-search-64 (1).png'))),
            )),
        // SizedBox(
        //   height: 5.h,
        // ),
        defaultText(
            txt: '${categori.name}',
            fontSize: 12.sp,
            fontWeight: FontWeight.normal)
      ],
    ),
  );
}
