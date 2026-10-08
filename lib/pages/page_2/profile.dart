import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            children: [
              Card(
                  child: Text("Manish Malhi")
              ),
              Container(color: Colors.blue),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.green),
              Container(color: Colors.red),
              Container(color: Colors.orange),
              Container(color: Colors.blue),
            ],
          ),
      
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        Card(child: Icon(Icons.person, size: 50)),
                        Card(child: Icon(Icons.person, size: 50)),
                        Card(child: Icon(Icons.person, size: 50)),
                        Card(child: Icon(Icons.person, size: 50)),
                      ],
                    ),
                  ),
                ),
              ),
      
              SizedBox(width: 10),
      
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        Card(child: Icon(Icons.person, size: 50)),
                        Card(child: Icon(Icons.person, size: 50)),
                        Card(child: Icon(Icons.person, size: 50)),
                        Card(child: Icon(Icons.person, size: 50)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 200,),
          Text("manish ")
        ],
      ),
    );
  }
}
