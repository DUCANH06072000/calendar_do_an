import 'package:flutter/material.dart';

class AppColor {
  //normal color
  static const transparent = Color(0x00000000);
  static Color transparent20 = const Color(0x33FFFFFF);

  static Color item_background_primary = const Color(0xCD1E2D36);
  static Color item_background = const Color(0x1affffff);
  static Color item_outline = const Color(0x33ffffff);
  static Color item_shadow = const Color(0x4D22303A);

  static const white = Color(0xFFFFFFFF);


  static Color primary = const Color(0xFF0C0C0C);
  static Color second_primary = const Color(0xFF00A9FE);
  static Color wiget_background = const Color(0xCC0E1010);



  static const black0 = Color(0xFFE9E9E9);
  static const black20 = Color(0xFFE9E9E9);
  static const black40 = Color(0xFFB9B9B9);
  static const black60 = Color(0xFFA9A9A9);
  static const black80 = Color(0xFF444546);
  static const black90 = Color(0xFF2D2D2D);
  static const black100 = Color(0xFF181A1B);
  static const black101 = Color(0xFF0A0A0B);
  static const black = Color(0xFF020202);

  static const blue100 = Color(0xFF2685CA);
  static const blue80 = Color(0xFF519DD5);
  static const blue60 = Color(0xFF7DB6DF);
  static const blue40 = Color(0xFFABCEEA);
  static const blue20 = Color(0xFFD4E7F4);
  static const neon1 = Color(0xFF00A9FE);

  static const green_no_version = Color(0xFF59FE5F);
  static const green100 = Color(0xFF53D258);
  static const green80 = Color(0xFF75D879);
  static const green60 = Color(0xFF98E49B);
  static const green40 = Color(0xFFBAEDBC);
  static const green20 = Color(0xFFDDF6DE);

  static const yellow100 = Color(0xFFFFA72A);
  static const yellow80 = Color(0xFFE5B920);
  static const yellow60 = Color(0xFFE3C96C);
  static const yellow40 = Color(0xFFF4E8BD);
  static const yellow20 = Color(0xFFFAF4DE);

  static const orange60 = Color(0xFFFF5733);
  static const orange40 = Color(0xFFF1592A);
  static const orangeRGB = Color.fromRGBO(241, 90, 41, 0.2);
  static const error = Color(0xFFFF3333);
  static const gray1 = Color(0xFF666666);
  static const gray2 = Color(0xFF999999);
  static const gray3 = Color(0xFFCCCCCC);
  static const gray4 = Color(0xFFDDDDDD);
  static const gray5 = Color(0xFFEEEEEE);
  static const gray6 = Color(0xFFCCCCCC);

  static const red = Color(0xFFC62828);

  static const textHello = Color(0xFF333333);
  static const activeTrackColor = Color(0xFF69CB3A);

  static Color background = const Color(0xFFF6F6F6);
  static Color nav_bottom_background = const Color(0xFF0C0C0C);

  static const hideButton = Color.fromARGB(229, 255, 195, 195);

  static List<Color> linearGradientColor = const [
    Color(0xffFFA72A),
    Color(0xffF0532D),
  ];

  //gradient color
  static const orangeGradient = LinearGradient(
      colors: [Color(0xFFF0532D), Color(0xFFFFA72A)],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft);

  static const yellowGradient = LinearGradient(
      colors: [Color(0xFFFDBC65), Color(0xFFFFDDAE)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);

  static const grayGradient = LinearGradient(
      colors: [Color(0x66FFFFFF), Color(0x33FFFFFF)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);

  static const blackGradient = LinearGradient(
      colors: [Color.fromARGB(46 ,0, 0, 0), Color.fromARGB(20, 0, 0, 0)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);

  static const blueGradient = LinearGradient(
      colors: [Color(0xFF05F0FF), Color(0xFF00A9FE)],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft);

  static const redGradient = LinearGradient(
      colors: [Color(0xFFFF2727), Color(0xFFFC5252)],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft);

  static const greenGradient = LinearGradient(
      colors: [Color(0xFF00A006), Color(0xFF98FF9C)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);

  static const blue50Gradient = LinearGradient(
      colors: [Color(0xFF19EEFF), Color(0xFF02C8FC)],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft);

  static const sliderGradient = LinearGradient(
      colors: [Color(0xFF05F0FF), Color(0xFF00A9FE), Color(0xFFADADAD), Color(0xFFADADAD), Color(0xFFADADAD)]);

  static const speedGradient = LinearGradient(
      colors: [Color(0xFF7FC045), Color(0xFFCEDA41), Color(0xFFFEE63D), Color(0xFFF5AE3B), Color(0xFFF77632), Color(0xFFFF1100)],
      begin: Alignment.bottomLeft,
      end: Alignment.bottomRight);

  static final shader =
    orangeGradient.createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
