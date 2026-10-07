import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text("manish"),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            subtitle: Text("This is the sub Title "),
          ),
        )

      ],
    );
  }
}
