import 'package:first_project/constants/app_colors.dart';
import 'package:first_project/constants/widgets%20components/button_widget.dart';
import 'package:first_project/pages/page_1/home_page_1.dart';
import 'package:first_project/pages/page_2/home_page_1.dart';
import 'package:first_project/pages/page_3/home_page_3.dart';
import 'package:first_project/pages/page_4/sharedPref.dart';
import 'package:flutter/material.dart';

class GetStartPage extends StatefulWidget {
  final String name;
  const GetStartPage({super.key, required this.name});

  @override
  State<GetStartPage> createState() => _GetStartPageState();
}

class _GetStartPageState extends State<GetStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("App Bar"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.sunny),
          ),
        ],
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.appBarLinearGradientColor,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.appBarLinearGradientColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(
                      "assets/images/anime_image.jpg",
                    ),
                  ),
                  Text(widget.name),
                  SizedBox(height: 10),
                ],
              ),
            ),

            Card(
              child: ListTile(
                onTap: () {},
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("profile "), SizedBox(height: 20)],
                ),
                subtitle: Text("data"),
                leading: Icon(Icons.person),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 1,
                          right: 10,
                          left: 10,
                          bottom: 1,
                        ),
                        child: Text("17:22"),
                      ),
                    ),
                    SizedBox(height: 5),
                    Icon(Icons.arrow_forward_ios_sharp, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_Image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            children: [

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => HomePage())),
                  );
                },
                child: ButtonWidget(title: "1 Page", buttonHeight: 40),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => HomePage1())),
                  );
                },
                child: ButtonWidget(title: "2 Page", buttonHeight: 40),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => HomePage3())),
                  );
                },
                child: ButtonWidget(title: "3 Page", buttonHeight: 40),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => Sharedpref())),
                  );
                },
                child: ButtonWidget(title: "shared Preferences", buttonHeight: 40),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
