import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;

  const BaseDialog(
      {Key? key, required this.child, this.color = Colors.black12, this.radius = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius)), //this right here
      child: child,
    );
  }
}
