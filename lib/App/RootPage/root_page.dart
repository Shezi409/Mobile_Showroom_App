import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Home/View/home_view.dart';
import '../Profile/View/profile_view.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int index = 0;
  final screens = [
    HomeView(),
    Center(child: Text("Search", style: TextStyle(fontSize: 72))),
    Center(child: Text("Favorite", style: TextStyle(fontSize: 72))),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.amber.shade200,
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            )),
        child: NavigationBar(
            height: 80,
            backgroundColor: const Color(0xFFf1f5fb),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            animationDuration: const Duration(seconds: 2),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border),
                label: "Favorite",
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: "Profile",
              )
            ]),
      ),
    );
  }
}
