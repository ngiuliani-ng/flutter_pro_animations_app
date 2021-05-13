import 'package:flutter/material.dart';

import 'package:flutter_pro_animations_app/pages/home.dart';
import 'package:flutter_pro_animations_app/pages/implicitlyAnimated.dart';
import 'package:flutter_pro_animations_app/pages/animatedBuilder.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        ImplicitlyAnimatedPage.routeName: (_) => ImplicitlyAnimatedPage(),
        AnimatedBuilderPage.routeName: (_) => AnimatedBuilderPage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
