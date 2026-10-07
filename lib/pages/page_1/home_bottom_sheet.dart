import 'package:flutter/material.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 500,
        width: double.infinity,
        child: Center(child: Text("Manish")),
      ),
    );
  }
}
