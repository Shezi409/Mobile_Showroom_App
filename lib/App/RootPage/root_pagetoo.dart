import 'package:flutter/material.dart';

import '../Categories/View/categories_view.dart';
import '../Home/View/home_view.dart';
import 'root_icon.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int index = 1;
  List<Widget> screens = [
    CategoriesView(),
    HomeView(),
    Container(
      color: Colors.grey,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        body: screens[index],
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 60,
                  child: Row(
                    children: [
                      RootIcon(
                        isSlected: index == 0,
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                      ),
                      const Spacer(),
                      RootIcon(
                        isSlected: index == 2,
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: RootIcon(
                  isSlected: index == 1,
                  isHome: true,
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
