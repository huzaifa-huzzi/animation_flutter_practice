// For changing the shapes of the container to rectangle and the square


import 'package:flutter/material.dart';

class TransformingAnimation extends StatefulWidget {
  const TransformingAnimation({super.key});

  @override
  State<TransformingAnimation> createState() => _TransformingAnimationState();
}

class _TransformingAnimationState extends State<TransformingAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> sizeAnimation;
  late Animation<BorderRadius?> transformingAnimation; // Allow nullable type
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // Define size animation
    sizeAnimation = Tween<double>(begin: 100, end: 200).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    // Define transforming animation for border radius
    transformingAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(125),
      end: BorderRadius.circular(0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
    );

    // Start the animation
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: sizeAnimation.value, // Use size animation for width
                    height: sizeAnimation.value,
                    color: Colors.blue,// Use size animation for height
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
