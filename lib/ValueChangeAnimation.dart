import 'package:flutter/material.dart';


class ValueChangeAnimation extends StatefulWidget {
  const ValueChangeAnimation({super.key});

  @override
  State<ValueChangeAnimation> createState() => _ValueChangeAnimationState();
}

class _ValueChangeAnimationState extends State<ValueChangeAnimation> with SingleTickerProviderStateMixin {

  late Animation<int> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(vsync: this,duration: const Duration(seconds: 4));

    animation = Tween(begin: 10,end: 0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
        animation:animationController ,
        builder:(context,child){
          return Scaffold(
            body: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Loading'),
                    Text(animation.value.toString(),style: const  TextStyle(fontSize: 16),),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
