import 'package:flutter/material.dart';
import 'package:untitled/ParentingAnimations.dart';
import 'package:untitled/TransformingAnimation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    home: TransformingAnimation(),
    );
  }
}

