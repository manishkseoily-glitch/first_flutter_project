import 'package:first_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double buttonHeight;
  final String title;

  const ButtonWidget({
    super.key,
    required this.buttonHeight,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,),
      child: Container(
        height: buttonHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.linearGradientColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(title,style: TextStyle(color: Colors.white, fontSize: 17),)),
      ),
    );
  }
}
