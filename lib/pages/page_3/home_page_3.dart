import 'package:first_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {

  String? selectedGender;
  bool checkValue = false;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 200,
                    width: 300,
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
                              border: Border.all(
                                color: Colors.black,width: 1,
                              )
                            ),
                            child: Image.asset("assets/images/empty_image.png", fit: BoxFit.fill,));
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 200,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Gender",
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text("Select Gender"),
                  initialValue: selectedGender,
                  items: const [
                    DropdownMenuItem(
                      value: "Male",
                      child: Text("Male"),
                    ),

                    DropdownMenuItem(
                      value: "Female",
                      child: Text("Female"),
                    ),

                    DropdownMenuItem(
                      value: "Other",
                      child: Text("Other"),
                    ),
                  ],

                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
              ),

              ListTile(
                leading: Checkbox(value: checkValue, onChanged: (value){
                  setState(() {
                    checkValue = value!;
                  });
                }),
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
              Text("manish"),
            ],
          ),
        ),
      ),
    );
  }
}
