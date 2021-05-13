import 'package:flutter/material.dart';

class ImplicitlyAnimatedPage extends StatelessWidget {
  static String routeName = '/home/implicitly-animated';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0,
      title: Text('ImplicitlyAnimated'),
      centerTitle: true,
    );
  }
}
