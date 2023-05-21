import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:azaiim/componant/const.dart';
import 'package:azaiim/cubit/home_cubit.dart';
import 'package:azaiim/moduel/home/home.dart';
import 'package:azaiim/moduel/splash_screen/splash_screen.dart';
import 'package:azaiim/share/cache_helper.dart';
import 'package:azaiim/share/dio_helper.dart';
import 'package:azaiim/share/dio_helper2.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  HttpOverrides.global = MyHttpOverrides();
  await CacheHelper.init();
  uid = CacheHelper.getShared(key: kLogin) != null
      ? CacheHelper.getShared(key: kLogin)
      : null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()
            ..getCategory()
            ..getProducts()
            ..gETCArts()
            ..getProductSales()
            ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Azaiim',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
