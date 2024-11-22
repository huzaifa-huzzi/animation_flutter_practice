import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class DelayedAnimations extends StatefulWidget {
  const DelayedAnimations({super.key});

  @override
  State<DelayedAnimations> createState() => _DelayedAnimationsState();
}

class _DelayedAnimationsState extends State<DelayedAnimations> {

  late Animation <int> animation,DelayedAnimation,muchDelayedAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animation =Tween(begin: -1,end:0).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));

    DelayedAnimation = Tween(begin: -1,end: 0).animate(CurvedAnimation(parent: animationController, curve:const  Interval(0.5, 1,curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1,end: 0).animate(CurvedAnimation(parent: animationController, curve: const Interval(0.5, 1,curve: Curves.fastOutSlowIn)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }
}
