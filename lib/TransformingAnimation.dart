// For changing the shapes of the container to rectangle and the square


import 'package:flutter/material.dart';


class TransformingAnimation extends StatefulWidget {
  const TransformingAnimation({super.key});

  @override
  State<TransformingAnimation> createState() => _TransformingAnimationState();
}

class _TransformingAnimationState extends State<TransformingAnimation>  with SingleTickerProviderStateMixin{

  late Animation<double> animation, transformingAnimation;
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

    transformingAnimation = BorderRadiusTween(begin: BorderRadius.circular(125),end: BorderRadius.circular(0)).animate(CurvedAnimation(parent: animationController, curve: Curves.ease)) as Animation<double> ;

    // Start the animation
    animationController.forward();
  }



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder
      (animation: AnimationController(vsync: this),
        builder: (context,child){
        return Scaffold(
          body: Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: animation.value,
                    height: animation.value,
                    decoration: BoxDecoration(
                      borderRadius: transformingAnim.value,
                      image: DecorationImage(
                          image: AssetImage('assets/placeholder.jpg'))
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        });
  }
}

@override
void dispose() {
  animationController.dispose();
  super.dispose();
}
}
