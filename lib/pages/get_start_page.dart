import 'package:first_project/constants/app_colors.dart';
import 'package:first_project/pages/page_1/home_page_1.dart';
import 'package:first_project/pages/page_2/home_page_1.dart';
import 'package:first_project/pages/page_3/home_page_3.dart';
import 'package:flutter/material.dart';

class GetStartPage extends StatefulWidget {
  String name;
   GetStartPage({super.key, required this.name});

  @override
  State<GetStartPage> createState() => _GetStartPageState();
}

class _GetStartPageState extends State<GetStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          height: 60,
          decoration: BoxDecoration(
            gradient: AppColors.appBarLinearGradientColor,
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
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/anime_image.jpg"),
                  ),
                  Text(widget.name),
                  SizedBox(height: 10,),
                ],
              ),
            ),

            ListTile(
              onTap: (){
              },
              tileColor: Colors.grey.shade400,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("profile "),
                  SizedBox(height: 20,)
                ],
              ),
              subtitle: Text("data"),
              leading: Icon(Icons.person),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1,right: 10,left: 10,bottom: 1),
                      child: Text("17:22"),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Icon(Icons.arrow_forward_ios_sharp, size: 20,)

                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: AppColors.linearGradientColor,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 100,
                      30,
                    ),
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
                  gradient: AppColors.linearGradientColor,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 100,
                      30,
                    ),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: AppColors.linearGradientColor,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 100,
                      30,
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) => HomePage3())),
                    );
                  },
                  child: Text("3 page"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
