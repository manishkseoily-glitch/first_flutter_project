import 'package:first_project/pages/page_2/about.dart';
import 'package:first_project/pages/page_2/home.dart';
import 'package:first_project/pages/page_2/profile.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  List pagesName = ["Home", "About", "Profile"];
  List<Widget> pages = [Home(), About(), Profile()];
  int changeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black, Colors.blue]),
          ),
        ),
        title: Text("App Bar"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: pages.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          changeIndex = index;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(
                            colors: changeIndex == index
                                ? [Colors.black, Colors.blue.shade700]
                                : [Colors.blue, Colors.blue.shade100],                        ),
                        ),
                        child: Center(
                          child: Text(
                            pagesName[index],
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                ),
              ),
            ),
          ),
          Expanded(child: pages[changeIndex]),
        ],
      ),
    );
  }
}
