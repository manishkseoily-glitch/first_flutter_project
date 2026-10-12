import 'package:first_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref extends StatefulWidget {
  const Sharedpref({super.key});

  @override
  State<Sharedpref> createState() => _SharedprefState();
}

class _SharedprefState extends State<Sharedpref> {
  TextEditingController input = TextEditingController();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // // }
  //
  // @override
  // void dispose() {
  //   input.dispose();
  //   super.dispose();
  // }

  List<String> dataList = [];
  String? tempVariable;

  Future<void> addData() async {
    // final pref = await SharedPreferences.getInstance();
    tempVariable = input.text.trim();
    if(tempVariable!.isNotEmpty){
      setState(() {
        dataList.add(tempVariable!);
        input.clear();
      });
      // await pref.setStringList("savedData", dataList);
    }
  }
  //
  // Future<void> getData() async{
  //   final pref = await SharedPreferences.getInstance();
  //     final data = pref.getStringList("savedData")?? [];
  //   setState(() {
  //     dataList =data;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("shared preference"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.appBarLinearGradientColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            " Save Data in Shared Preference",
            style: TextStyle(fontSize: 20),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: input,
                  decoration: InputDecoration(
                    hintText: "Save Data",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 1, color: Colors.red),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  addData();
                },
                child: Text("save"),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey
                      ),
                      child: Center(child: Text(dataList[index]))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
