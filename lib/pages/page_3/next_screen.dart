import 'package:first_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {

  String? nameIs;
  String? passwordIs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dateCont = TextEditingController();
  TextEditingController timeCont = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final formKeyIs = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailFocus.requestFocus();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  void setData() {
    nameIs = email.text;
    passwordIs = email.text;
  }

  DateTime? date;
  Future<void> pickDate() async {
    date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    setState(() {
      dateCont.text =
          "${date?.day}/"
          "${date?.month}/"
          "${date?.year}";
    });
  }

  TimeOfDay? time;
  Future<void> timePicked() async {
    time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      timeCont.text = time!.format(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text("Login Page"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              gradient: AppColors.appBarLinearGradientColor,
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKeyIs,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email", style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: email,
                  textInputAction: TextInputAction.next,
                  focusNode: emailFocus,
                  onFieldSubmitted: (_) {
                    passwordFocus.requestFocus();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter email ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        email.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                    hintText: "enter email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text("Password", style: TextStyle(fontSize: 18)),
                TextFormField(
                  controller: password,
                  focusNode: passwordFocus,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter password ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "enter password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        password.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Text("Select Date", style: TextStyle(fontSize: 18)),
                TextFormField(
                  onTap: () {
                    pickDate();
                  },
                  readOnly: true,
                  controller: dateCont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please pick date";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          dateCont.clear();
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                    hint: Text("Please Picked Date"),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Text("Select Time", style: TextStyle(fontSize: 18)),
                TextFormField(
                  onTap: () {
                    timePicked();
                  },
                  readOnly: true,
                  controller: timeCont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please pick time";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          timeCont.clear();
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                    hint: Text("please Pick Time"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (formKeyIs.currentState!.validate()) {
                        emailFocus.unfocus();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.blue,
                            content: Text("Form is submit successfully"),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(20),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: AppColors.linearGradientColor,
                      ),
                      child: Center(
                        child: Text(
                          "Login ",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }
}
