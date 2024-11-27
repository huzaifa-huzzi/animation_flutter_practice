import 'package:flutter/material.dart';



class ParentingAnimations extends StatefulWidget {
  const ParentingAnimations({super.key});

  @override
  State<ParentingAnimations> createState() => _ParentingAnimationsState();
}

class _ParentingAnimationsState extends State<ParentingAnimations> with SingleTickerProviderStateMixin {

  late Animation animation,childAnimation;
  late AnimationController animationController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this,duration: const  Duration(seconds: 10));

    animation = Tween(begin: -0.1,end: 0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    childAnimation = Tween(begin: 20,end: 125).animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));

  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController,
        builder: (context,index){
          return

        });
  }
}
