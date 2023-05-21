import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/moduel/cart/cart.dart';
import 'package:azaiim/moduel/cart/cart_screen.dart';
import 'package:azaiim/moduel/feeds/get_product_category.dart';
import 'package:azaiim/moduel/feeds/get_products.dart';
import 'package:azaiim/moduel/web_view/web_view%20copy.dart';

class ProductCategories extends StatelessWidget {
  String? name;
  ProductCategories({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
           if (state is AddCartssSucsses) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: defaultText(
                                        txt: 'لقد اضفت المنتج بنجاح',
                                        color: Colors.white,
                                      ),
                                      duration: Duration(seconds: 1),
                                      backgroundColor: mainColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                    ));
                                  }
        },
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            body: cubit.proCategory != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.redAccent,
                          height: 100.h,
                          width: double.infinity,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 40.h, right: 10.w, left: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  defaultText(
                                      txt: '${name}',
                                      fontSize: 18.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.h, right: 15.w),
                                    child: BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              nextPage(
                                  context: context,
                                  page: Carts());
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
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blueGrey.shade50),
                          height: 580.h,
                          child: cubit.proCategory!.isNotEmpty
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(right: 10.w, left: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      Expanded(
                                        child: GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10,
                                                    childAspectRatio: 1 / 1.45,
                                                    mainAxisSpacing: 10),
                                            shrinkWrap: true,
                                            // physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) =>
                                                getProducts(
                                                    cubit.proCategory![index],
                                                    context,state),
                                            itemCount: cubit
                                                .proCategory!.length),
                                      ),
                                    ],
                                  ),
                                )
                              : Center(child: CupertinoActivityIndicator()),
                        ),
                      ],
                    ),
                  )
                : Center(child: CupertinoActivityIndicator()),
          );
        });
  }
}
