

import 'package:flutter/material.dart';

class DelayedAnimations extends StatefulWidget {
  const DelayedAnimations({super.key});

  @override
  State<DelayedAnimations> createState() => _DelayedAnimationsState();
}

class _DelayedAnimationsState extends State<DelayedAnimations> with SingleTickerProviderStateMixin {
  late Animation<double> animation, delayedAnimation, muchDelayedAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Initialize animations
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.7, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    // Start the animation
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Align(
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              children: [
                Transform(
                  transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.all(16),
                      child: const Text('Login', style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Transform(
                  transform: Matrix4.translationValues(delayedAnimation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(16),
                      child: const Text('Signup', style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Transform(
                  transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16),
                      child: const Text('Container', style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
