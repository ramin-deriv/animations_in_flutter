import 'package:flutter/material.dart';

class PageFrame extends StatelessWidget {
  final String title;
  final Widget child;

  const PageFrame({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: child),
    );
  }
}
