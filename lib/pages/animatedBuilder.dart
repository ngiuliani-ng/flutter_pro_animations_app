import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatelessWidget {
  static String routeName = '/home/animated-builder';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0,
      title: Text('AnimatedBuilder'),
      centerTitle: true,
    );
  }
}
