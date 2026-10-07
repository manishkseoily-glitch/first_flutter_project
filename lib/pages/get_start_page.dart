import 'package:first_project/pages/page_1/home_page_1.dart';
import 'package:first_project/pages/page_2/home_page_1.dart';
import 'package:flutter/material.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black, Colors.blue]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                "App Bar ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.sunny),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXoZR-yrqOjzm1iWB9SxXuxFS_cPdh1AC-ZY1YP4niOw&s=10",),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [Colors.black, Colors.blue]),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width - 100, 30),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => HomePage())),
                  );
                },
                child: Text("1 page"),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [Colors.black, Colors.blue]),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width - 100, 30),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => HomePage1())),
                  );
                },
                child: Text("2 page"),
              ),
            ),
          ],
        )
      ),
    );
  }
}
