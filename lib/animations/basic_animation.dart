import 'package:flutter/material.dart';

class BasicAnimationExample extends StatefulWidget {
  @override
  _BasicAnimationExampleState createState() => _BasicAnimationExampleState();
}

class _BasicAnimationExampleState extends State<BasicAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animationController.value,
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
