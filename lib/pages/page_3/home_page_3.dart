import 'package:first_project/constants/app_colors.dart';
import 'package:first_project/pages/page_3/next_screen.dart';
import 'package:flutter/material.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  String gender = "male";
  bool switchButton = false;

  String? selectedGender;
  bool checkValue = false;
  late double w = MediaQuery.of(context).size.width;
  late double h = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.appBarLinearGradientColor,
          ),
        ),
        title: Text("Home Page 3"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/anime_image.jpg",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("buy Now"),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(child: Text("Get More Detail")),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBB4LQTn0vRq4ydPLp-uTj_lEUHOHYWUU18JlCq5KuMw&s=10",
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 300,
                            width: 300,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Image.asset(
                              "assets/images/empty_image.png",
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: w / 2,
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Gender",
                      border: OutlineInputBorder(),
                    ),
                    hint: const Text("Select Gender"),
                    initialValue: selectedGender,
                    items: const [
                      DropdownMenuItem(value: "Male", child: Text("Male")),

                      DropdownMenuItem(value: "Female", child: Text("Female")),

                      DropdownMenuItem(value: "Other", child: Text("Other")),
                    ],

                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),

                ListTile(
                  leading: Checkbox(
                    value: checkValue,
                    onChanged: (value) {
                      setState(() {
                        checkValue = value!;
                      });
                    },
                  ),
                  title: Text("agree term and conditions"),
                ),

                Card(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  child: ExpansionTile(
                    shape: const Border(),
                    collapsedShape: const Border(),
                    title: const Text("Read More"),
                    children: const [
                      Text("This is the extra text."),
                      Text("Here is some more information."),
                    ],
                  ),
                ),
                Divider(color: Colors.black, indent: w / 3, endIndent: w / 3),

                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    direction: Axis.vertical,
                    children:
                        [
                          "Electronics",
                          "Fashion",
                          "Shoes",
                        ].map((category) {
                          return Chip(label: Text(category));
                        }).toList(),
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NextScreen()),
                    );
                  },
                  child: Text("next page "),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "select gender",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        title: const Text('Male'),
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Female'),
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),

                      RadioListTile<String>(
                        title: const Text('Other'),
                        value: 'other',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),

                      RadioListTile<String>(
                        title: Text("gender"),
                        value: "gender",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Switch(value: switchButton, onChanged: (value){
                  setState(() {
                    switchButton = value;
                  });
                }),
                SizedBox(height: 10,),

                Text('Selected: $gender'),
                SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
