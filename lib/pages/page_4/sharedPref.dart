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

  @override
  void initState() {
    super.initState();
    getData();
  }

  String? addItem;
  List<String> getDataList = [];

  Future<void> addData() async {
    final pref = await SharedPreferences.getInstance();
    getDataList = pref.getStringList("savedData") ?? [];
    if (input.text.isNotEmpty) {
      addItem = input.text.trim();
      setState(() {
        getDataList.add(addItem!);
      });
      await pref.setStringList("savedData", getDataList);
    }
    getData();
    input.clear();
    if(mounted){
      Navigator.pop(context);
    }
  }


  List<String> printList = [];

  Future<void> getData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      printList = pref.getStringList("savedData") ?? [];
    });
  }

  Future<void> deleteData(int index) async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      printList = pref.getStringList("savedData") ?? [];
      printList.removeAt(index);
      pref.setStringList("savedData", printList);
    });
    getData();
  }

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
          Expanded(
            child: ListView.builder(
              itemCount: printList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                printList[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Delete Data?'),
                                      content: const Text(
                                        'Are you sure you want to delete this data?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('No'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            deleteData(index);
                                            if(mounted){
                                             Navigator.pop(context);
                                            }
                                          },
                                          child: const Text('Yes'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: ((context) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Save Data in Shared Preference",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          controller: input,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: (){
                              input.clear();
                            }, icon: Icon(Icons.clear)),
                            hintText: "Save Data",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              addData();
                            },
                            child: Text("save", style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
