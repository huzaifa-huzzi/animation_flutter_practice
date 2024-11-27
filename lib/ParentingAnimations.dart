import 'package:flutter/material.dart';

class ParentingAnimations extends StatefulWidget {
  const ParentingAnimations({super.key});

  @override
  State<ParentingAnimations> createState() => _ParentingAnimationsState();
}

class _ParentingAnimationsState extends State<ParentingAnimations>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation, childAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // Define animations using CurvedAnimation for better transitions
    animation = Tween<double>(begin: -0.1, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    childAnimation = Tween<double>(begin: 20.0, end: 125.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    // Start the animation
    animationController.forward();
  }



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Container(
              child: Transform(
                transform: Matrix4.translationValues(
                  animation.value * width, // animation.value is now a double
                  0,
                  0,
                ),
                child: AnimatedBuilder(
                  animation: childAnimation,
                  builder: (context, child) {
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: childAnimation.value * 2,
                        width: childAnimation.value * 2,
                        child: ListView(
                          children: const [
                            TextField(
                              decoration: InputDecoration(hintText: 'Username'),
                            ),
                            SizedBox(height: 15),
                            TextField(
                              decoration: InputDecoration(hintText: 'Password'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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

