import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // list Tile
        Card(
          child: ListTile(
            title: Text("manish"),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            subtitle: Text("This is the sub Title "),
          ),
        ),

        // image loading
        Image.network(
          "https://static.vecteezy.com/system/resources/thumbnails/083/933/835/small/beautiful-and-inspiring-picture-detailing-a-bright-hot-air-balloon-over-river-pure-cozy-perfect-for-creatives-moods-stock-image-free-photo.jpeg",

          // 1. Image loading
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              // Image successfully loaded
              return child;
            }
            // Image is still loading
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                backgroundColor: Colors.black,
              ),
            );
          },

          // 2. Image failed to load
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),
              child: Icon(Icons.border_clear),
            );
          },
        ),
      ],
    );
  }
}
