import 'package:carousel_slider/carousel_slider.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/componant/style.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/moduel/all_products/all_products.dart';
import 'package:azaiim/moduel/cart/cart.dart';
import 'package:azaiim/moduel/cart/cart_screen.dart';
import 'package:azaiim/moduel/communication/communication.dart';
import 'package:azaiim/moduel/feeds/get_category.dart';
import 'package:azaiim/moduel/feeds/get_product_category.dart';
import 'package:azaiim/moduel/feeds/get_products.dart';
import 'package:azaiim/moduel/feeds/get_products_sales.dart';
import 'package:azaiim/moduel/web_view/web_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Feeds extends StatefulWidget {
  Feeds({Key? key}) : super(key: key);

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  List<String> images = [
    // 'images/appetizing-kofta-kebab-meatballs-with-sauce-tortllas-tacos-black-table.jpg',
    'images/delicious-arabic-fast-food-meat-rolls-veggies.jpg',
    'images/baked-chicken-wings-asian-style.jpg'
  ];

  int index = 0;
  bool isCategory = false;
  bool isSearch = false;
  bool isNoty = false;
  bool isPrivacy = false;
  bool isAbout = false;
  bool isUpdate = false;
  bool isMomaiaz = false;
  var scafolldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    scafolldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scafolldKey,
        drawer: Drawer(
          width: 270.w,
            child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 40.h, bottom: 15.h, right: 20.w, left: 50.h),
                  child: Row(
                    children: [
                      Container(
                        child: Image.asset(
                          'images/redlogo.png',
                          height: 120.h,
                          width: 140.w,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: txtColor,
                  indent: 10,
                  endIndent: 20,
                  height: .001,
                ),
                SizedBox(
                  height: 40.h,
                ),
                InkWell(
                  onTap: () {
                    scafolldKey.currentState!.closeDrawer();
                    setState(() {
                      isCategory = false;
                    });
                    nextPage(context: context, page: Feeds());
                  },
                  child: Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultText(
                            txt: 'الصفحة الرئيسية',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                          size: 31,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    scafolldKey.currentState!.closeDrawer();
                    setState(() {
                      isPrivacy = true;
                    });
                  },
                  child: Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultText(
                            txt: 'سياسة الاستخدام',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset(
                          'images/01.svg',
                          color: Colors.white,
                          semanticsLabel: 'Acme Logo',
                          height: 30.h,
                          width: 30,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isAbout = true;
                    });
                    scafolldKey.currentState!.closeDrawer();
                  },
                  child: Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultText(
                            txt: 'معلومات التطبيــق',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset(
                          'images/02.svg',
                          color: Colors.white,
                          height: 30.h,
                          width: 30.w,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    scafolldKey.currentState!.closeDrawer();
                  },
                  child: Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultText(
                            txt: 'تقيــــــم التطبيــق',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset(
                          'images/03.svg',
                          color: Colors.white,
                          height: 30.h,
                          width: 30.w,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    scafolldKey.currentState!.closeDrawer();
                    nextPage(context: context, page: Communication());
                  },
                  child: Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultText(
                            txt: 'اتصـــل بنـــا',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset(
                          'images/04.svg',
                          color: Colors.white,
                          height: 30.h,
                          width: 30.w,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {
                    scafolldKey.currentState!.closeDrawer();
                    setState(() {
                      isUpdate = true;
                      isAbout = false;
                    });
                  },
                  child: Container(
                    height: 40.h,
                    width: 250.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defaultText(
                            txt: 'اعدادات التطبيــق',
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset(
                          'images/05.svg',
                          color: Colors.white,
                          height: 30.h,
                          width: 30.w,
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 110.h,
                  ),
                  child: InkWell(
                    onTap: () {
                      scafolldKey.currentState!.closeDrawer();
                      //  nextPage(context: context, page: Momaiaze());
//
                      setState(() {
                        isMomaiaz = !isMomaiaz;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultText(
                            txt: ' مميز ',
                            color: mainColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                        defaultText(
                            txt: 'تصميم وتطوير',
                            color: txtColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Stack(alignment: Alignment.topCenter, children: [
                Container(
                  height: 100.h,
                  width: double.infinity,
                  color: mainColor,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            openDrawer();
                          },
                          child: Image.asset(
                            'images/Path 2567.png',
                            color: Colors.white,
                          ),
                        ),
                        // SizedBox(
                        //   width: 60.w,
                        // ),
                        Image.asset(
                          'images/white logo1.png',
                          height: 50.h,
                          width: 140.w,
                          fit: BoxFit.contain,
                        ),
                        BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              nextPage(context: context, page: Carts());
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 90.h),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: MediaQuery.of(context).size.height * 1.37,
                    child: Column(
                      children: [
                        Container(
                          // color: Colors.grey.shade100,
                          child: BlocConsumer<HomeCubit, HomeState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                HomeCubit cubit = HomeCubit.get(context);
                                return cubit.categories != null
                                    ? Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Container(
                                            height: 110.h,
                                            child: cubit.categories.isNotEmpty
                                                ? ListView.separated(
                                                    shrinkWrap: true,
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (context,
                                                            index) =>
                                                        InkWell(
                                                          onTap: () {
                                                            print(cubit
                                                                .categories[
                                                                    index]
                                                                .id);
                                                            setState(() {
                                                              isCategory = true;
                                                            });
                                                            HomeCubit.get(
                                                                    context)
                                                                .getProductsCategory(cubit
                                                                    .categories[
                                                                        index]
                                                                    .id);
                                                          },
                                                          child: getCategory(
                                                              cubit.categories[
                                                                  index],
                                                              context),
                                                        ),
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                    itemCount:
                                                        cubit.categories.length)
                                                : Center(
                                                    child:
                                                        CupertinoActivityIndicator()),
                                          ),
                                          if (isCategory == true)
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isCategory = false;
                                                });
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.sp),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_back,
                                                      color: Colors.black,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                        ],
                                      )
                                    : Center(
                                        child: CupertinoActivityIndicator());
                              }),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        if (isCategory == false)
                          Column(
                            children: [
                              Container(
                                height: 180.h,
                                color: Colors.grey.shade100,
                                child: Center(
                                  child: Container(
                                    height: 160.h,
                                    // color: Colors.grey.shade100,
                                    width: 360.w,
                                    child: CarouselSlider(
                                        items: images
                                            .map((e) => Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image:
                                                              AssetImage(e))),
                                                  // child: Image.asset(
                                                  //       e,
                                                  //       fit: BoxFit.cover,
                                                  //       width: double.infinity,
                                                  //     ),
                                                ))
                                            .toList(),
                                        options: CarouselOptions(
                                          onPageChanged: (index1, reason) {
                                            setState(() {
                                              index = index1;
                                            });
                                          },

                                          // autoPlayInterval: Duration(seconds: 7),
                                          // viewportFraction: 1,
                                          // height: double.infinity,
                                          autoPlay: true,
                                          reverse: false,
                                          autoPlayCurve: Curves.easeInOut,

                                          enlargeCenterPage: true,
                                          // pauseAutoPlayOnTouch: false,
                                          // pauseAutoPlayOnManualNavigate: false,
                                          // pauseAutoPlayInFiniteScroll: true,

                                          autoPlayAnimationDuration:
                                              Duration(seconds: 13),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AnimatedSmoothIndicator(
                                  curve: Curves.easeInOut,
                                  effect: ExpandingDotsEffect(
                                      activeDotColor: Colors.orangeAccent,
                                      dotColor: Colors.grey,
                                      dotHeight: 5,
                                      dotWidth: 10,
                                      radius: 10,
                                      spacing: 2,
                                      paintStyle: PaintingStyle.fill,
                                      strokeWidth: 0),
                                  activeIndex: index,
                                  count: images.length),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blueGrey.shade50),
                                height: 280.h,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w, left: 10.w, top: 20.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              nextPage(
                                                  context: context,
                                                  page: AllProducts());
                                            },
                                            child: defaultText(
                                                txt: ' عرض المزيد ',
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          defaultText(
                                              txt: ' المآكولات ',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    BlocConsumer<HomeCubit, HomeState>(
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
                                    }, builder: (context, state) {
                                      HomeCubit cubit = HomeCubit.get(context);
                                      return cubit.products != null
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color:
                                                      Colors.blueGrey.shade50),
                                              height: 220.h,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.w, left: 10.w),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // SizedBox(
                                                    //   height: 10.h,
                                                    // ),
                                                    cubit.products.isNotEmpty
                                                        ? Container(
                                                            height: 220.h,
                                                            child: ListView
                                                                .separated(
                                                                    separatorBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            SizedBox(
                                                                              width: 10.w,
                                                                            ),
                                                                    shrinkWrap:
                                                                        true,
                                                                    // physics: BouncingScrollPhysics(),
                                                                    scrollDirection:
                                                                        Axis
                                                                            .horizontal,
                                                                    itemBuilder: (context, index) => getProducts(
                                                                        cubit.products[
                                                                            index],
                                                                        context,
                                                                        state),
                                                                    itemCount:
                                                                        10),
                                                          )
                                                        : Center(
                                                            child:
                                                                CupertinoActivityIndicator()),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child:
                                                  CupertinoActivityIndicator());
                                    }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.blueGrey.shade50),
                                height: 290.h,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 10.w, left: 10.w, top: 20.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          defaultText(
                                              txt: ' افضل العروض ',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                          // defaultText(
                                          //     txt: ' عرض المزيد ',
                                          //     fontSize: 13.sp,
                                          //     fontWeight: FontWeight.normal),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    BlocConsumer<HomeCubit, HomeState>(
                                        listener: (context, state) {},
                                        builder: (context, state) {
                                          HomeCubit cubit =
                                              HomeCubit.get(context);
                                          return cubit.productsSales != null
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: Colors
                                                          .blueGrey.shade50),
                                                  height: 220.h,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10.w,
                                                        left: 10.w),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // SizedBox(
                                                        //   height: 10.h,
                                                        // ),
                                                        cubit.productsSales
                                                                    .length >
                                                                0
                                                            ? Container(
                                                                height: 220.h,
                                                                child: ListView
                                                                    .separated(
                                                                        separatorBuilder: (context,
                                                                                index) =>
                                                                            SizedBox(
                                                                              width: 10.w,
                                                                            ),
                                                                        shrinkWrap:
                                                                            true,
                                                                        // physics: BouncingScrollPhysics(),
                                                                        scrollDirection:
                                                                            Axis
                                                                                .horizontal,
                                                                        itemBuilder: (context, index) => getProducts(
                                                                            cubit.productsSales[
                                                                                index],
                                                                            context,
                                                                            state),
                                                                        itemCount: cubit
                                                                            .productsSales
                                                                            .length),
                                                              )
                                                            : Center(
                                                                child:
                                                                    CupertinoActivityIndicator()),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CupertinoActivityIndicator());
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        if (isCategory == true)
                          BlocConsumer<HomeCubit, HomeState>(
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
                                    borderRadius: BorderRadius.circular(7)),
                              ));
                            }
                          }, builder: (context, state) {
                            HomeCubit cubit = HomeCubit.get(context);
                            return cubit.proCategory != null
                                ? Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.blueGrey.shade50),
                                    height: 480.h,
                                    child: cubit.proCategory!.isNotEmpty
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                right: 10.w, left: 10.w),
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
                                                              crossAxisSpacing:
                                                                  10,
                                                              childAspectRatio:
                                                                  1 / 1.45,
                                                              mainAxisSpacing:
                                                                  10),
                                                      shrinkWrap: true,
                                                      // physics: BouncingScrollPhysics(),
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemBuilder: (context,
                                                              index) =>
                                                          getProducts(
                                                              cubit.proCategory![
                                                                  index],
                                                              context,
                                                              state),
                                                      itemCount: cubit
                                                          .proCategory!.length),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Center(
                                            child:
                                                CupertinoActivityIndicator()),
                                  )
                                : Center(child: CupertinoActivityIndicator());
                          }),
                      ],
                    ),
                  ),
                ),
              ]),
              if (isUpdate == true)
                Padding(
                  padding: EdgeInsets.only(top: 80.h, left: 10.w, right: 10.w),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.8),
                      // border: Border.all(color: Colors.grey, width: .03),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Container(
                          margin: EdgeInsets.only(right: 10.w, left: 10.w),
                          height: 70.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            border: Border.all(color: Colors.grey, width: .03),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Column(
                              children: [
                                defaultText(
                                    txt:
                                        '  لا يوجد تحديثات جديدة للتطبيق الان  ',
                                    color: txtColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 5.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isUpdate = false;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      defaultText(
                                          txt: ' »   ',
                                          color: txtColor,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                      defaultText(
                                          txt: 'خروج ',
                                          color: Colors.redAccent,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))),
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
