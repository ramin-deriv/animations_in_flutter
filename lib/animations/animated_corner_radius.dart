import 'package:flutter/material.dart';

class AnimatedCornerRadius extends ImplicitlyAnimatedWidget {
  final BorderRadius borderRadius;
  final Widget child;

  AnimatedCornerRadius({
    required this.child,
    required this.borderRadius,
    Duration duration = const Duration(milliseconds: 400),
    Key? key,
    Curve curve = Curves.linear,
  }) : super(duration: duration, curve: curve, key: key);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCornerRadiusState();
}

class _AnimatedCornerRadiusState
    extends AnimatedWidgetBaseState<AnimatedCornerRadius> {
  BorderRadiusTween? _borderRadiusTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _borderRadiusTween = visitor(
      _borderRadiusTween,
      widget.borderRadius,
      (dynamic value) => BorderRadiusTween(begin: value),
    ) as BorderRadiusTween?;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadiusTween!.evaluate(animation),
      child: widget.child,
    );
  }
}
