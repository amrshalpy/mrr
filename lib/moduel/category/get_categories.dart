import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/const.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/model/category_model.dart';
import 'package:azaiim/moduel/product_categories/product_categories.dart';

Widget getCategories(CategoryModel categori,context) {
  return InkWell(
    onTap: (){
       HomeCubit.get(context).getProductsCategory(categori.id);
      nextPage(context: context, page: ProductCategories(name: categori.name,));
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      height: 70.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          defaultText(
              txt: '${categori.name}',
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
          SizedBox(
            width: 25.h,
          ),
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
        ],
      ),
    ),
  );
}
