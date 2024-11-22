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

      ),
    );
  }
}
