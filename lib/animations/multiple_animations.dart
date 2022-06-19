import 'dart:math';

import 'package:flutter/material.dart';

class MultipleAnimationsExample extends StatefulWidget {
  @override
  _MultipleAnimationsExampleState createState() =>
      _MultipleAnimationsExampleState();
}

class _MultipleAnimationsExampleState extends State<MultipleAnimationsExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _scaleAnimation;
  late Animation _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _scaleAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutCubic);
    _rotateAnimation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _rotateAnimation.value,
      child: Transform.scale(
        scale: _scaleAnimation.value,
        child: Container(
          color: Colors.deepOrange,
          width: 50.0,
          height: 50.0,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
