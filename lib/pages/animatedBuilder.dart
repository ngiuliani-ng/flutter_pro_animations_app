import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  static String routeName = '/home/animated-builder';

  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 5),

      /// I ticker possono essere usati da qualsiasi widget che voglia essere notificato ogni volta che un frame si innesca.
      /// [vsync] è il [TickerProvider] per il contesto corrente.
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0,
      title: Text('AnimatedBuilder'),
      actions: [
        IconButton(
          icon: Icon(Icons.stop),
          onPressed: () => animationController.stop(),
        ),
        IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () => animationController.repeat(),
        ),
      ],
    );
  }

  Widget body() {
    return Center(
      child: AnimatedBuilder(
        animation: animationController,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        builder: (context, child) => Transform.rotate(
          angle: animationController.value * 2 * math.pi,
          child: child,
        ),
      ),
    );
  }
}
