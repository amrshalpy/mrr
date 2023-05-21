import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/model/product_model.dart';
import 'package:azaiim/moduel/details/details.dart';

Widget getProducts(ProductModel product, context, HomeState state) {
  return InkWell(
    onTap: () {
      nextPage(
          context: context,
          page: Details(
            productModel: product,
            img: product.images[0].src,
            name: product.name,
            price: product.price,
            desc: product.shortDescription,
            id: product.id,
          ));
    },
    child: Container(
      height: 140.h,
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
                image: product.images.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(product.images[0].src),
                        fit: BoxFit.cover)
                    : DecorationImage(
                        image: AssetImage('images/icons8-search-64 (1).png'),
                        fit: BoxFit.contain)),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 30.h,
            width: 165.w,
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: Text(
                      product.name != null ? ' ${product.name}  ' : ' -',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          height: 1.2,
                          fontFamily: 'GE_SS_Two',
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
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
                    product.price != null ? '${product.price}' : ' -',
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
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: mainColor),
              onPressed: () {
                // HomeCubit.get(context).AddTOCartss();
                // Timer(Duration(seconds: 2), () {
                //   nextPage(context: context, page: WebViewScreen(url: '${product.id}',));
                // });
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
