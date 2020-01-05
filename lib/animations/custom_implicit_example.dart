import 'package:animations_in_flutter/animations/animated_corner_radius.dart';
import 'package:flutter/material.dart';

class CustomImplicitAnimationExample extends StatefulWidget {

  @override
  _CustomImplicitAnimationExampleState createState() => _CustomImplicitAnimationExampleState();
}

class _CustomImplicitAnimationExampleState extends State<CustomImplicitAnimationExample> {

  bool roundedCorner = false;
  double radius = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState((){
          radius = roundedCorner ? 0.0 : 50.0;
          roundedCorner = !roundedCorner;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedCornerRadius(
            borderRadius: BorderRadius.circular(radius),
            duration: Duration(seconds: 2),
            child: Container(
              color: Colors.deepOrange,
              width: 50.0,
              height: 50.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text('Click me!')
        ],
      ),
    );
  }
}