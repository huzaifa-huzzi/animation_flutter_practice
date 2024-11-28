import 'package:flutter/material.dart';


class MixingAnimation extends StatefulWidget {
  const MixingAnimation({super.key});

  @override
  State<MixingAnimation> createState() => _MixingAnimationState();
}

class _MixingAnimationState extends State<MixingAnimation> with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    animation = Tween(begin: 0.0, end: -0.15).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final width= MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: animation,
        builder: (context,child){
          return Scaffold(
            body: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 350 ,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.red,)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.blue,)),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue
                        ),
                        transform: Matrix4.translationValues(0.0, animation.value * width, 0.0),
                      ),
                      onTap: (){
                        animationController.forward();
                      },
                      onDoubleTap: (){
                        animationController.reverse();
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
