import 'package:flutter/material.dart';

class PageFrame extends StatelessWidget {
  final String title;
  final Widget child;

  const PageFrame({Key key, this.title, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Color.fromRGBO(27, 33, 44, 1.0),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
