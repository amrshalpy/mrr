import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/moduel/details/details.dart';
import 'package:azaiim/moduel/feeds/get_products.dart';
import 'package:azaiim/moduel/search/get_search.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                      height: 90.h,
                      width: double.infinity,
                      color: mainColor,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h, right: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: defaultText(
                                  txt: " البحث عن المنتجات",
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Image.asset(
                              'images/icons8-search-64 (1).png',
                              height: 40.h,
                              width: 40.w,
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              height: 40.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(width: .2),
                              ),
                              child: TextField(
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 15.w, right: 15.w),
                                    border: InputBorder.none),
                                controller: controller,
                                onChanged: (value) {
                                  cubit.searchProducts(value);
                                },
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.black26,
                            )
                          ],
                        ),
                        controller.text != ''
                            ? cubit.productsCategory != null
                                ? Container(
                                    color: Colors.grey.shade100,
                                    height: 500.h,
                                    width: double.infinity,
                                    child: cubit.productsCategory != []
                                        ? ListView.separated(
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                                  onTap: () {
                                                    nextPage(
                                                        context: context,
                                                        page: Details(
                                                          desc: cubit
                                                              .productsCategory[
                                                                  index]
                                                              .description,
                                                          img: cubit
                                                              .productsCategory[
                                                                  index]
                                                              .images[0]
                                                              .src,
                                                          name: cubit
                                                              .productsCategory[
                                                                  index]
                                                              .name,
                                                          price: cubit
                                                              .productsCategory[
                                                                  index]
                                                              .price,
                                                        ));
                                                    setState(() {
                                                      controller.clear();
                                                      controller.text = '';
                                                    });
                                                  },
                                                  child: getSearch(
                                                      cubit.productsCategory[
                                                          index],
                                                      context),
                                                ),
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                                      height: 10.h,
                                                    ),
                                            itemCount:
                                                cubit.productsCategory.length)
                                        : SizedBox(),
                                  )
                                : SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(top: 200.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    defaultText(
                                        txt: 'ابحث عن المنتجات',
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black26),
                                    Image.asset(
                                      'images/icons8-search-64.png',
                                      height: 40.h,
                                      width: 40.w,
                                    )
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
