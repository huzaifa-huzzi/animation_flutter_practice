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
   delayedAnimation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController, curve:const Interval(0.5, 1.0,curve: Curves.fastOutSlowIn)));
   // muchDelayedAnimation
   muchDelayedAnimation = Tween(begin: -1.0,end: 0.0).animate(CurvedAnimation(parent: animationController, curve:const Interval(0.8, 1.0,curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

   final double width = MediaQuery.of(context).size.width;
   animationController.forward();

    return AnimatedBuilder(
        animation: animation,
        builder: (context,child){
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Column(
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
                      child: const TextField(
                          decoration: InputDecoration(
                              hintText: 'Username',
                              prefixIcon: Icon(Icons.add)
                          )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Transform(
                      transform: Matrix4.translationValues(delayedAnimation.value * width, 0.0, 0.0),
                      child: const TextField(
                          decoration: InputDecoration(
                              hintText: 'Username',
                              prefixIcon: Icon(Icons.add)
                          )
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Transform(
                  transform: Matrix4.translationValues(muchDelayedAnimation.value* width, 0.0, 0.0),
                  child: Container(
                    height: 200,
                    width: 300,
                    color: Colors.red,
                    child:const  Center(
                      child: Text('Login'),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
