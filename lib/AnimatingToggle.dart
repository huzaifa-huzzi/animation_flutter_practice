import 'package:flutter/material.dart';



class AnimationToggle extends StatefulWidget {
  const AnimationToggle({super.key});

  @override
  State<AnimationToggle> createState() => _AnimationToggleState();
}

class _AnimationToggleState extends State<AnimationToggle> {

  late var toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: toggleValue ? Colors.greenAccent[100] : Colors.redAccent[100]!.withOpacity(0.5)
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeIn,
                top: 3,
                left: toggleValue ? 60 : 0.0,
                right: toggleValue ? 0.0: 60,
                  child: InkWell(
                    onTap:toggleButton,
                    child: AnimatedSwitcher(duration: const Duration(milliseconds:1000 ),
                    transitionBuilder: (child,Animation<double> animation){
                       return RotationTransition(turns: animation,child: child,);
                    },
                      child: toggleValue ? Icon(Icons.check_circle,color: Colors.green,size: 35,key: UniqueKey(),) : Icon(Icons.remove_circle_outline,color: Colors.red,size: 35,key: UniqueKey(),)
                    ),
                  ) ,
              )
            ],
          ),
        ),
      ),
    );
  }

  toggleButton(){
    setState(() {
      toggleValue = !toggleValue ;
    });
  }

}
