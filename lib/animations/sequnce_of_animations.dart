import 'dart:math';

import 'package:flutter/material.dart';

class SequenceOfAnimationsExample extends StatefulWidget {

  @override
  _SequenceOfAnimationsExampleState createState() => _SequenceOfAnimationsExampleState();

}

class _SequenceOfAnimationsExampleState extends State<SequenceOfAnimationsExample> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation _scaleAnimation;
  Animation _rotateAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _scaleAnimation = CurvedAnimation(parent: _animationController, curve: Interval(0.0, 0.5, curve: Curves.easeOutCubic));
    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.5, 1.0)));
    _animationController.addListener((){
      setState(() {

      });
    });
    _animationController.repeat();
    super.initState();
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
