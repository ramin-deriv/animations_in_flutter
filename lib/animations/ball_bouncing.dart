import 'package:flutter/material.dart';

const BALL_RADIUS = 40.0;
const BALL_DIAMETER = 2 * BALL_RADIUS;

class BallBouncingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 400.0,
      child: BallBouncing(),
    );
  }
}

class BallBouncing extends StatefulWidget {
  @override
  _BallBouncingState createState() => _BallBouncingState();
}

class _BallBouncingState extends State<BallBouncing>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation bounceAnimation;

  late Size widgetSize;

  GlobalKey widgetKey = GlobalKey();

  _setSizes() {
    final RenderBox renderBoxRed =
        widgetKey.currentContext?.findRenderObject() as RenderBox;
    widgetSize = renderBoxRed.size;
  }

  _startAnimation() {
    _setSizes();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    bounceAnimation =
        Tween<double>(begin: 0.0, end: widgetSize.height - BALL_RADIUS).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.bounceOut));
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat();
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _startAnimation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      child: widgetSize == null
          ? Container()
          : Container(
              width: widgetSize.width,
              height: widgetSize.height,
              child: CustomPaint(
                painter: BouncingPainter(
                  ballTop: bounceAnimation.value,
                  animationPercent: _animationController.value,
                ),
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

class BouncingPainter extends CustomPainter {
  final Paint ballPaint;
  final double ballTop;
  final double animationPercent;

  BouncingPainter({required this.animationPercent, required this.ballTop})
      : ballPaint = Paint()..color = Colors.deepOrange;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2.0;
    double ballBottom;

    double top = ballTop - BALL_RADIUS * animationPercent;

    if (top + BALL_DIAMETER >= size.height) {
      ballBottom = size.height;
    } else {
      ballBottom = top + BALL_DIAMETER;
    }

    canvas.drawOval(
        Rect.fromLTRB(
            centerX - BALL_RADIUS, top, centerX + BALL_RADIUS, ballBottom),
        ballPaint);

    canvas.drawLine(
        Offset(0.0, size.height), Offset(size.width, size.height), ballPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
