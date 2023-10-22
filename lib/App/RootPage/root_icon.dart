import 'package:flutter/material.dart';

class RootIcon extends StatelessWidget {
  final bool isHome;
  final bool isSlected;

  final VoidCallback onTap;

  const RootIcon(
      {super.key,
      this.isHome = false,
      this.isSlected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: isHome
            ? const BoxDecoration(color: Colors.green, shape: BoxShape.circle)
            : const BoxDecoration(),
        height: 60,
        width: MediaQuery.of(context).size.width / 3,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.home,
            color: isSlected ? Colors.amber : Colors.black,
            size: 30,
          ),
          if (isHome == false)
            Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                Text("Home"),
              ],
            ),
        ]),
      ),
    );
  }
}
