import 'package:first_project/pages/get_start_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.yellow, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                'assets/images/anime_image.jpg',
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30),
                                ),
                              ),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Login Page',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 12),

                                    TextFormField(
                                      controller: name,
                                      textInputAction: TextInputAction.next,
                                      decoration: inputDecorationWidget(
                                        'Enter Name',
                                        Icons.person,
                                        name,
                                      ),
                                      validator: (value) =>
                                          value == null || value.trim().isEmpty
                                          ? 'Please enter name'
                                          : null,
                                    ),

                                    const SizedBox(height: 12),

                                    TextFormField(
                                      controller: email,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: inputDecorationWidget(
                                        'Enter email',
                                        Icons.email,
                                        email,
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            !value.contains('@')) {
                                          return 'Please enter valid email';
                                        }
                                        return null;
                                      },
                                    ),

                                    const SizedBox(height: 12),

                                    TextFormField(
                                      controller: password,
                                      obscureText: true,
                                      decoration: inputDecorationWidget(
                                        'Enter Password',
                                        Icons.password,
                                        password,
                                      ),
                                      validator: (value) =>
                                          value == null || value.isEmpty
                                          ? 'Please enter password'
                                          : null,
                                    ),

                                    const SizedBox(height: 20),

                                    Container(
                                      width: 130,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(
                                          colors: [Colors.black, Colors.blue],
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            FocusScope.of(context).unfocus();
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: ((context) =>
                                                    GetStartPage(
                                                      name: name.text,
                                                    )),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text('Login'),
                                      ),
                                    ),

                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('Register'),
                                    ),
                                  ],
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
            },
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecorationWidget(
    String hint,
    IconData icon,
    TextEditingController control,
  ) {
    return InputDecoration(
      prefixIcon: Icon(icon, size: 18),
      hintText: hint,
      suffixIcon: IconButton(
        onPressed: () {
          control.clear();
        },
        icon: Icon(Icons.clear, size: 18),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
