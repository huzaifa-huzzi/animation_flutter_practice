import 'package:flutter/material.dart';
import 'package:untitled/CardAnimations.dart';
import 'package:untitled/CarouselAnimation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: CarouselAnimation(),
    );
  }
}

