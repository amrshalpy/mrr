import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/componant.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/model/product_model.dart';

class GetCarts extends StatelessWidget {
  ProductModel? productModel;
  int? index;
  int? quantity;
  GetCarts({this.productModel, this.quantity, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(width: .2),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 140,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 160.w,
                    child: Wrap(
                      children: [
                        Center(
                          child: Text(
                            '${productModel!.name}',
                            textAlign: TextAlign.center,
                            // maxLines: 1,
                            style: TextStyle(
                              height: 1.2,
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      defaultText(txt: '  د.ك   '),
                      Text(
                        HomeCubit.get(context).price[index].toString(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  // Column(
                  //   children: [
                  //     defaultText(
                  //         txt: 'اختر الكمية',
                  //         fontSize: 12.sp,
                  //         fontWeight: FontWeight.normal),
                  //     SizedBox(
                  //       height: 5.h,
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         InkWell(
                  //           onTap: () {
                  //             HomeCubit.get(context).addCarts(productModel!);
                  //             HomeCubit.get(context).changeQauntity(quantity!+1);
                  //           },
                  //           child: Container(
                  //             height: 30.h,
                  //             width: 30.w,
                  //             decoration: BoxDecoration(
                  //               color: Colors.amber,
                  //               borderRadius: BorderRadius.circular(7),
                  //               // border: Border.all(width: .2),
                  //             ),
                  //             child: Icon(
                  //               Icons.add,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 15.w,
                  //         ),
                  //         Container(
                  //             height: 30.h,
                  //             width: 50.w,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(7),
                  //               border: Border.all(width: .2),
                  //             ),
                  //             child: Center(
                  //                 child: Text(
                  //               '${quantity}',
                  //               style: TextStyle(
                  //                   color: Colors.black, fontSize: 15.sp),
                  //             ))),
                  //         SizedBox(
                  //           width: 15.w,
                  //         ),
                  //         InkWell(
                  //           onTap: () {
                  //             HomeCubit.get(context).changeQauntity(quantity);
                  //             HomeCubit.get(context).removeCart(productModel!);
                  //           },
                  //           child: Container(
                  //             height: 30.h,
                  //             width: 30.w,
                  //             decoration: BoxDecoration(
                  //               color: Colors.amber,
                  //               borderRadius: BorderRadius.circular(7),
                  //               // border: Border.all(width: .2),
                  //             ),
                  //             child: Icon(
                  //               Icons.remove,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Column(
                    children: [
                      defaultText(txt: 'الكمية', color: Colors.black),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        '1 X',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 120.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            '${productModel!.images[0].src}',
                          ))),
                ),
                InkWell(
                  onTap: () {
                    HomeCubit.get(context).removeOneProduct(productModel!);
                    // HomeCubit.get(context)
                    //     .AddTOCartss(productId: productModel!.id, quantity: 0);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    maxRadius: 13,
                    child: Icon(
                      Icons.clear_sharp,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
