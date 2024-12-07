import 'package:flutter/material.dart';

class CarouselAnimation extends StatefulWidget {
  const CarouselAnimation({super.key});

  @override
  State<CarouselAnimation> createState() => _CarouselAnimationState();
}

class _CarouselAnimationState extends State<CarouselAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<int> carouselAnimation;
  int photosIndex = 0;

  List<String> photos = [
    'https://via.placeholder.com/400x300?text=Image+1',
    'https://via.placeholder.com/400x300?text=Image+2',
    'https://via.placeholder.com/400x300?text=Image+3',
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    carouselAnimation = IntTween(begin: 0, end: photos.length - 1).animate(controller)
      ..addListener(() {
        setState(() {
          photosIndex = carouselAnimation.value;
        });
      });

    // Start animation and loop it
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Animation'),
      ),
      body: Center(
        child: photos.isEmpty
            ? const Text('No photos available')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 300,
              child: Image.network(
                photos[photosIndex],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                photos.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: photosIndex == index
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
