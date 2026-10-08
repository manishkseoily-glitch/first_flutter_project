import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF2196F3);
  static const Color secondary = Color(0xFFFF9800);

  // appBar Color
  static const LinearGradient appBarLinearGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.black, Colors.blue],
  );

  // button Linear Gradient color
  static const LinearGradient linearGradientColor = LinearGradient(
    colors: [Colors.black, Colors.blue],
  );
}
