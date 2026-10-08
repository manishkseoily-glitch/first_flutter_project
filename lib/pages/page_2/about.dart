import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text("About Page"),
        // use wrap
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.blue,
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.green,
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.orange,
            ),
          ],
        )
      ],
    );
  }
}
