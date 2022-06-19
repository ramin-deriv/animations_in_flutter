import 'package:flutter/material.dart';

class CurvesComparison extends StatefulWidget {
  @override
  _CurvesComparisonState createState() => _CurvesComparisonState();
}

class _CurvesComparisonState extends State<CurvesComparison>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation linearCurve;
  late Animation elasticCurve;
  late Animation easeCurve;
  late Animation bounceCurve;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    linearCurve = Tween<double>(begin: -100.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    elasticCurve = Tween<double>(begin: -100.0, end: 100.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    easeCurve = Tween<double>(begin: -100.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    bounceCurve = Tween<double>(begin: -100.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _controller.addListener((){
      setState(() {

      });
    });
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40.0,),
        Text('linear', style: TextStyle(color: Colors.white70),),
        Container(
          transform: Matrix4.translationValues(linearCurve.value, 0.0, 0.0),
          color: Colors.deepOrange,
          width: 20.0,
          height: 20.0,
        ),
        SizedBox(height: 40.0,),
        Text('easeOut', style: TextStyle(color: Colors.white70),),
        Container(
          transform: Matrix4.translationValues(easeCurve.value, 0.0, 0.0),
          color: Colors.deepOrange,
          width: 20.0,
          height: 20.0,
        ),
        SizedBox(height: 40.0,),
        Text('elasticOut', style: TextStyle(color: Colors.white70),),
        Container(
          transform: Matrix4.translationValues(elasticCurve.value, 0.0, 0.0),
          color: Colors.deepOrange,
          width: 20.0,
          height: 20.0,
        ),
        SizedBox(height: 40.0,),
        Text('bounceOut', style: TextStyle(color: Colors.white70),),
        Container(
          transform: Matrix4.translationValues(bounceCurve.value, 0.0, 0.0),
          color: Colors.deepOrange,
          width: 20.0,
          height: 20.0,
        )
      ],
    );
  }
}
