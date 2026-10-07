import 'package:flutter/material.dart';
import 'home_bottom_sheet.dart';
import 'imp_widgets_1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black87, Colors.blue]),
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Home Page", style: TextStyle(fontSize: 23)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.sunny),
          ),
        ],
      ),
      // drawer: Drawer(),

      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.blue,
                ]),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.blue,
                ]),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.black,
                ]),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.black,
                ]),
                shape: BoxShape.circle,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [


                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.yellow],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 60,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        buttonWidgets(
                          "button 1 ",
                          Colors.orange.shade300,
                          Icon(Icons.arrow_forward_sharp),
                        ),
                        SizedBox(width: 10),
                        buttonWidgets(
                          "button 2",
                          Colors.blue.shade300,
                          Icon(Icons.arrow_forward_sharp),
                        ),
                        SizedBox(width: 10),
                        buttonWidgets(
                          "button 3",
                          Colors.purple.shade300,
                          Icon(Icons.arrow_forward_sharp),
                        ),
                      ],
                    ),
                  ),
                ),

                //Linear Gradient color Container
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red.shade900, Colors.white],
                          ),
                        ),
                      ),
                    ),
                    Text("Manish Malhi", style: TextStyle(fontSize: 20,fontFamily: "font01"),),
                    Expanded(
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.red.shade900],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // use Flexible widget
                Row(
                  children: [
                    Icon(Icons.person),

                    SizedBox(width: 10),

                    Flexible(
                      child: Text(
                        "Hello Flutter, this is a very very very long text "
                        "that does not fit in the available screen width",
                      ),
                    ),
                  ],
                ),
                Card(
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple,
                              blurRadius: 20,
                              spreadRadius: 1,
                              offset: Offset(5,5),),
                          ],
                          border: Border.all(color: Colors.grey,width: 2),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("asset/images/anime_image.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Hello Flutter, this is a very very very long text "
                                  "that does not fit in the available screen width",
                            ),                        ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: (context),
            builder: ((context) {
              return HomeBottomSheet();
            }),
          );
        },
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home Page"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_rounded),
            label: "About",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
        ],
      ),
    );
  }
}
