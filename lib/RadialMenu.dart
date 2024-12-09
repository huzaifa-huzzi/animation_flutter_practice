import 'dart:math';

import 'package:flutter/material.dart';

class RadialMenu extends StatefulWidget {
  const RadialMenu({super.key});

  @override
  State<RadialMenu> createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> {
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Radial buttons
          ..._buildRadialButtons(),
          // Main button
          Align(
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: opened
                  ? InkWell(
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    opened = false;
                  });
                },
              )
                  : InkWell(
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Icon(Icons.menu, color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    opened = true;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRadialButtons() {
    if (!opened) return [];

    final List<Widget> buttons = [];
    const double radius = 100;
    final List<IconData> icons = [
      Icons.home,
      Icons.search,
      Icons.settings,
      Icons.person,
    ];

    for (int i = 0; i < icons.length; i++) {
      final double angle = (i * (360 / icons.length)) * (3.14159 / 180);
      final double dx = radius * cos(angle);
      final double dy = radius * sin(angle);

      buttons.add(
        Positioned(
          left: MediaQuery.of(context).size.width / 2 + dx - 30,
          top: MediaQuery.of(context).size.height / 2 + dy - 30,
          child: InkWell(
            onTap: () {
              debugPrint("Button $i clicked");
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.green,
              ),
              child: Center(
                child: Icon(icons[i], color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }
    return buttons;
  }
}
