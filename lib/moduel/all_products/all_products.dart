import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/moduel/feeds/get_product_category.dart';
import 'package:azaiim/moduel/feeds/get_products.dart';
import 'package:azaiim/moduel/home/home.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
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
            body: cubit.products != null
                ? Column(
                    children: [
                      Container(
                        color: mainColor,
                        height: 100.h,
                        width: double.infinity,
                        child: Padding(
                            padding: EdgeInsets.only(top: 50.h, right: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      nextPage(context: context, page: Home());
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                                defaultText(
                                    txt: 'كل الاصناف',
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ],
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueGrey.shade50),
                        height: 580.h,
                        child: cubit.products.isNotEmpty
                            ? Padding(
                                padding:
                                    EdgeInsets.only(right: 10.w, left: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              getProducts(cubit.products[index],
                                                  context,state),
                                          itemCount: cubit.products.length),
                                    ),
                                  ],
                                ),
                              )
                            : Center(child: CupertinoActivityIndicator()),
                      ),
                    ],
                  )
                : Center(child: CupertinoActivityIndicator()),
          );
        });
  }
}
