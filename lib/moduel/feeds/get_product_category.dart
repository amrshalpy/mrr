import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/model/add_carts.dart';
import 'package:azaiim/model/category_product.dart';
import 'package:azaiim/model/product_model.dart';
import 'package:azaiim/moduel/details/details.dart';
import 'package:azaiim/moduel/web_view/web_view.dart';

Widget getProductsCategory(ProductModel product, BuildContext context) {
  return InkWell(
    onTap: () {
      nextPage(
          context: context,
          page: Details(
            img: product.images[0].src,
            id: product.id,
            name: product.name,
            price: product.price,
            desc: product.shortDescription,
          ));
    },
    child: Container(
      height: 210.h,
      width: 165.w,
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(width: .2),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18),
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18)),
      ),
      child: Column(
        children: [
          Container(
            height: 110.h,
            width: 165.w,
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)),
                image: DecorationImage(
                    image: NetworkImage('${product.images[0].src}'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.w, left: 3.w),
            child: Column(
              children: [
                Container(
                  height: 30.h,
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Text(product.name != null ? '${product.name}' : "",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'GE_SS_Two',
                              height: 1,
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        defaultText(
                            txt: '  د.ك',
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.normal),
                        Text(
                          product.price != null ? '${product.price}' : "",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        defaultText(
                            txt: ' 4.5',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                        Icon(
                          Icons.star,
                          size: 18.sp,
                          color: Colors.orangeAccent,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: mainColor),
              onPressed: () {
                HomeCubit.get(context).addCarts(product);
                HomeCubit.get(context).AddTOCartss(
                  productId: HomeCubit.get(context).productId,
                  quantity: 1,
                );
              },
              child: defaultText(txt: 'اضف الي السلة', color: Colors.white))
        ],
      ),
    ),
  );
}
