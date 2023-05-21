import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:azaiim/cubit/Home_state.dart';
import 'package:azaiim/cubit/home_cubit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController(initialPage: 0);
  int maxCount = 4;
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  cubit.screens.length, (index) => cubit.screens[index]),
            ),
            extendBody: true,
            bottomNavigationBar: (cubit.screens.length <= maxCount)
                ? AnimatedNotchBottomBar(
                    pageController: _pageController,
                    color: Colors.white,
                    showLabel: false,
                    notchColor: Colors.orangeAccent,
                    bottomBarItems: [
                      BottomBarItem(
                        inActiveItem:
                            Image.asset('images/icons8-home-page-64.png'),
                        activeItem:
                            Image.asset('images/icons8-home-page-64.png'),
                        itemLabel: 'Home',
                      ),

                      ///svg example
                      BottomBarItem(
                        inActiveItem: Image.asset(
                          'images/Path 2567.png',
                          color: Colors.blueGrey,
                        ),
                        activeItem: Image.asset(
                          'images/Path 2567.png',
                          color: Colors.white,
                        ),
                        itemLabel: 'Categoryies',
                      ),
                      const BottomBarItem(
                        inActiveItem: Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        ),
                        activeItem: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        itemLabel: 'Settings',
                      ),
                      const BottomBarItem(
                        inActiveItem: Icon(
                          Icons.shopping_cart,
                          color: Colors.blueGrey,
                        ),
                        activeItem: Icon(
                          Icons.shopping_cart,
                          color: Colors.yellow,
                        ),
                        itemLabel: 'Carts',
                      ),
                    ],
                    onTap: (index) {
                      /// control your animation using page controller
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 10),
                        curve: Curves.easeIn,
                      );
                    },
                  )
                : null,
          );
        });
  }
}
