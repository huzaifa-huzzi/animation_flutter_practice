import 'package:flutter/material.dart';

class ValueChangeAnimation extends StatefulWidget {
  const ValueChangeAnimation({super.key});

  @override
  State<ValueChangeAnimation> createState() => _ValueChangeAnimationState();
}

class _ValueChangeAnimationState extends State<ValueChangeAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<int> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // Use IntTween for integer interpolation
    animation = IntTween(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Loading'),
                Text(
                  animation.value.toString(),
                  style: const TextStyle(fontSize: 50),
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
