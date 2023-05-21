import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/model/woocommerce.dart';
import 'package:azaiim/moduel/category/get_categories.dart';
import 'package:azaiim/moduel/feeds/get_category.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

class Categoryies extends StatelessWidget {
  const Categoryies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
  

    return Column(
      children: [
        Container(
          height: 90.h,
          color: mainColor,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 40.h, right: 10.w, left: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  defaultText(txt: 'الاقسام', fontSize: 20.sp),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset(
                    'images/Path 2567.png',
                    height: 30.h,
                    width: 30.w,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          child: Container(
            height: 550.h,
            color: Colors.grey.shade100,
            child: BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  HomeCubit cubit = HomeCubit.get(context);
                  return cubit.categories != null
                      ? Container(
                          height: double.infinity,
                          child: cubit.categories != []
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  // scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      getCategories(
                                          cubit.categories[index], context),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 10.w,
                                      ),
                                  itemCount: cubit.categories.length)
                              : Center(child: CupertinoActivityIndicator()),
                        )
                      : Center(child: CupertinoActivityIndicator());
                }),
          ),
        ),
      ],
    );
  }
}
