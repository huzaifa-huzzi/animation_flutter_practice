import 'package:flutter/material.dart';

class CardAnimations extends StatefulWidget {
  const CardAnimations({super.key});

  @override
  State<CardAnimations> createState() => _CardAnimationsState();
}

class _CardAnimationsState extends State<CardAnimations> with SingleTickerProviderStateMixin {

 late Animation<double> cardAnimation,delayedCardANimation,fabButtonAnimation,infoButtonAnimation ;
 late AnimationController animationController ;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    cardAnimation=Tween(begin: 0.0,end: -0.025).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
    delayedCardANimation = Tween(begin: 0.0,end: -0.05).animate(CurvedAnimation(parent: animationController, curve: Interval(0.5, 1.0,curve: Curves.fastOutSlowIn)));
    fabButtonAnimation = Tween(begin: 0.0,end: -0.0008).animate(CurvedAnimation(parent: animationController, curve: Interval(0.8, 1.0,curve: Curves.fastOutSlowIn)));
    infoButtonAnimation = Tween(begin: 0.0,end: 0.025).animate(CurvedAnimation(parent: animationController, curve: Interval(0.7, 1.0,curve: Curves.fastOutSlowIn)));

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
   final double height = MediaQuery.of(context).size.height ;
   animationController.forward();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // First card
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.orange[200],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // Second card
            Positioned(
              top: 20,
              left: 40,
              right: 40,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // Third card
            Positioned(
              top: 0,
              left: 60,
              right: 60,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // Buttons at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cross button
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.red, size: 30),
                      onPressed: () {
                        // Add cross button functionality here
                      },
                    ),
                    // Comments button
                    IconButton(
                      icon: Icon(Icons.comment, color: Colors.grey, size: 30),
                      onPressed: () {
                        // Add comments button functionality here
                      },
                    ),
                    // Heart button
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.pink, size: 30),
                      onPressed: () {
                        // Add heart button functionality here
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  }

