import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  /// Custom Components.
  AppButton({
    @required this.color,
    @required this.title,
    @required this.onPressed,
  });

  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: double.infinity,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
