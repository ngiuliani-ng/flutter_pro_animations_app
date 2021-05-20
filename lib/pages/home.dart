import 'package:flutter/material.dart';

import 'package:flutter_pro_animations_app/pages/implicitlyAnimated.dart';
import 'package:flutter_pro_animations_app/pages/animatedBuilder.dart';

import 'package:flutter_pro_animations_app/components/appButton.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              color: Colors.blue,
              title: 'ImplicitlyAnimated',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ImplicitlyAnimatedPage.routeName,
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            AppButton(
              color: Colors.blue,
              title: 'AnimatedBuilder',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AnimatedBuilderPage.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
