import 'package:first_project/pages/login_pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    nextPage();
  }

  Future<void> nextPage()async{
    await Future.delayed(Duration(seconds: 3));
    if(mounted){
      Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRIbsBqG7REMZ9ZSzmFJm2TqqL0iqHQIBL11mjaoWTQ&s=10",
              ),
            ),
            SizedBox(height: 10,),
            Text("Welcome to", style: TextStyle(fontSize: 20,fontFamily: "font01"),),
            Text("Task Manager App", style: TextStyle(fontSize: 20, fontFamily: "font01"),),

            SizedBox(height: 30,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
