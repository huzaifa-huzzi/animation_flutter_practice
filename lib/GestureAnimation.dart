import 'package:flutter/material.dart';


class GestureAnimation extends StatefulWidget {
  const GestureAnimation({super.key});

  @override
  State<GestureAnimation> createState() => _GestureAnimationState();
}

class _GestureAnimationState extends State<GestureAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Gestures'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
            child: InkWell(
              onTap: (){
                print('Clicked');
              },
              child: Container(
                height: 70,
                width: 100,
                padding:const  EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //
                  borderRadius: BorderRadius.circular(15),
                ),
                child:const Center(child: Text('Click me')),
              ),
            ),
      ),
    );
  }
}
