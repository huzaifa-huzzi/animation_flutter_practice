import 'package:flutter/material.dart';



class AnimationUi extends StatefulWidget {
  const AnimationUi({super.key});

  @override
  State<AnimationUi> createState() => _AnimationUiState();
}

class _AnimationUiState extends State<AnimationUi> with SingleTickerProviderStateMixin {

 late Animation <double> animation,delayedAnimation,muchDelayedAnimation;
 late AnimationController animationController ;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
     // animation
   animation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
   // delayedAnimation
   delayedAnimation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController, curve:Interval(0.5, 1.0,curve: Curves.fastOutSlowIn)));
   //
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: builder)
  }
}
