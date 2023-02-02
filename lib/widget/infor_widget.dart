import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {

  String label;
  final fontWeight;
  double? size;
  Color? color;

  TextWidget(
      {Key? key,
      required this.label,
      this.fontWeight,
      this.size,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        label,
        style: TextStyle(
            fontWeight: fontWeight,
            fontSize: size,
            color: color,
            fontFamily: "Roboto"),
      ),
    );
  }
}
