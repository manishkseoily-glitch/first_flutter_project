import 'package:flutter/material.dart';

Widget buttonWidgets(String name, Color color, Icon icon) {
  // use expended widgets
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),)),
          icon,
        ],
      ),
    ),
  );
}
