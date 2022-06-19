import 'package:flutter/material.dart';

class CurvedAnimationExample extends StatefulWidget {
  @override
  _CurvedAnimationExampleState createState() => _CurvedAnimationExampleState();
}

class _CurvedAnimationExampleState extends State<CurvedAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animation.value,
      child: Container(
        color: Colors.deepOrange,
        width: 50.0,
        height: 50.0,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
