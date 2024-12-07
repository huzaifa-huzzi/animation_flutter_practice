import 'package:flutter/material.dart';



class FlipAnimation extends StatefulWidget {
  const FlipAnimation({super.key});

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<int> flip ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(seconds: 5));
    flip = Tween(begin: 0,end: -1).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.5,curve: Curves.linear)));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Flip Animations'),
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context,child){
            return Center(
              child: InkWell(
                onTap: (){
                  controller.repeat();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  child: Transform(
                      transform: Matrix4.identity() ..rotateX(2*Pi*flip.value),
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                      child: RotationTransition(
                          turns: flip,
                        child : Text('This flips')

                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
