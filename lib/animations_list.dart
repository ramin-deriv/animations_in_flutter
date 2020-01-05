import 'package:animations_in_flutter/animations/animated_opacity.dart';
import 'package:animations_in_flutter/animations/basic_animation_with_animated_builder.dart';
import 'package:animations_in_flutter/animations/curved_animation.dart';
import 'package:animations_in_flutter/animations/curves.dart';
import 'package:animations_in_flutter/animations/custom_implicit_example.dart';
import 'package:animations_in_flutter/animations/multiple_animations.dart';
import 'package:animations_in_flutter/animations/sequnce_of_animations.dart';
import 'package:animations_in_flutter/page_frame.dart';
import 'package:flutter/material.dart';

import 'animations/ball_bouncing.dart';
import 'animations/basic_animation.dart';

class AnimationsList extends StatefulWidget {
  @override
  _AnimationsListState createState() => _AnimationsListState();
}

class _AnimationsListState extends State<AnimationsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Animations in Flutter'),
        leading: FlutterLogo(size: 5.0,),

      ),
      body: ListView.builder(
          itemCount: examples.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(examples[i].title),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PageFrame(
                        title: examples[i].title,
                        child: examples[i].widget,
                      ))),
            );
          }),
    );
  }
}

class Example {
  final String title;
  final Widget widget;

  Example({this.title, this.widget});
}

List<Example> examples = [
  Example(
    title: 'Basic Animation',
    widget: BasicAnimationExample(),
  ),
  Example(
    title: 'Basic Animation with AnimatedBuilder',
    widget: BasicAnimationAnimatedBuilderExample(),
  ),
  Example(
    title: 'Curved Animation',
    widget: CurvedAnimationExample(),
  ),
  Example(
    title: 'Multiple Animations',
    widget: MultipleAnimationsExample(),
  ),
  Example(
    title: 'Sequence of Animations',
    widget: SequenceOfAnimationsExample(),
  ),
  Example(
    title: 'Implicit Animation Example',
    widget: AnimatedOpacityExample(),
  ),
  Example(
    title: 'Custom Implicit Animation Example',
    widget: CustomImplicitAnimationExample(),
  ),
  Example(
    title: 'Bouncing Ball',
    widget: BallBouncingContainer(),
  ),
  Example(
    title: 'Curves Comparison',
    widget: CurvesComparison(),
  ),
];
