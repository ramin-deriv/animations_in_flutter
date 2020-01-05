import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  @override
  _AnimatedOpacityExampleState createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool isOpaque = false;
  double opacity = 0.1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          opacity = isOpaque ? 0.1 : 1.0;
          isOpaque = !isOpaque;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(seconds: 2),
            child: Container(
              color: Colors.deepOrange,
              width: 50.0,
              height: 50.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text('Click me!'),
        ],
      ),
    );
  }
}
