import 'package:flutter/material.dart';

class BasicAnimationAnimatedBuilderExample extends StatefulWidget {
  @override
  _BasicAnimationAnimatedBuilderExampleState createState() =>
      _BasicAnimationAnimatedBuilderExampleState();
}

class _BasicAnimationAnimatedBuilderExampleState
    extends State<BasicAnimationAnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Container(
        color: Colors.deepOrange,
        width: 50.0,
        height: 50.0,
      ),
      builder: (context, child) {
        return Transform.scale(
          scale: _animationController.value,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
