import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';

class Communication extends StatelessWidget {
  const Communication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: mainColor),
        child: Padding(
          padding:
              EdgeInsets.only(top: 50.h, left: 15.w, right: 15.w, bottom: 20.h),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 600.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: mainColor),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 570.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 60.h,
                          left: 15.w,
                          right: 15.w,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 230.w,
                                  height: 40.h,
                                  child: Wrap(
                                    children: [
                                      defaultText(
                                          txt:
                                              'للتواصل والاستفسارات اتصل بنا علي الارقام الآتية',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SvgPicture.asset(
                                  'images/call icone (2).svg',
                                  color: mainColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            BlocBuilder<HomeCubit, HomeState>(
                                builder: (context, state) {
                              HomeCubit cubit = HomeCubit.get(context);
                              return Container(
                                height: 150.h,
                                width: 250.w,
                                child: ListView.separated(
                                    itemBuilder: (context, index) => Container(
                                          child: InkWell(
                                            onTap: () {
                                              cubit.getPhoneIndex(
                                                  cubit.phones[index]);
                                              print(cubit.phone);
                                            },
                                            child: Center(
                                                child: Text(
                                              cubit.phones[index],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 18.h,
                                          child: Divider(),
                                        ),
                                    itemCount: cubit.phones.length),
                              );
                            }),
                            Divider(),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                defaultText(
                                    txt: 'للشكاوي ',
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  width: 10.h,
                                ),
                                SvgPicture.asset(
                                  'images/Mail.svg',
                                  color: mainColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70.h,
                width: 70.w,
                child: Image.asset(
                  'images/icons8-phone-call-64.png',
                  // color: Colors.black,
                  // fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
