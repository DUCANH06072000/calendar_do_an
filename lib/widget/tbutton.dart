import 'package:flutter/material.dart';

class TButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? paddingContent;
  final EdgeInsetsGeometry margin;
  final Color? color;
  final ShapeBorder? shape;
  final double? width;
  final double? height;
  final bool splash;
  final Decoration? decoration;

  const TButton(
      {Key? key,
        required this.child,
        required this.onPressed,
        this.onLongPress,
        this.shape,
        this.padding = EdgeInsets.zero,
        this.margin = EdgeInsets.zero,
        this.color, this.width, this.height, this.splash = true, this.decoration, this.paddingContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: decoration,
      padding: paddingContent,
      child: MaterialButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        color: color,
        splashColor: splash ? Colors.black26 : Colors.transparent,
        highlightColor: Colors.transparent,
        height: 0,
        minWidth: 0,
        shape: shape,
        padding: padding,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: child,
      ),
    );
  }
}
