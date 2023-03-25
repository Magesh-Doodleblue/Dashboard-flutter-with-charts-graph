// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warpe_dashboard_task/presentation/screens/user/Dashboard.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/Vector.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Spacer(),
                                  Image.asset("assets/logo.png"),
                                  const Spacer(),
                                  Text(
                                    "Welcome to\nBubble Tree",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700]),
                                  ),
                                  const Spacer(
                                    flex: 3,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email/Username",
                                  ),
                                  validator: loginUserNameValidation,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: TextFormField(
                                  controller: passwordController,
                                  validator: loginPassValidation,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                  ),
                                  obscureText: true,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  onChanged: (value) {},
                                ),
                              ),
                              const SizedBox(height: 32),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 64,
                                child: ElevatedButton(
                                  onPressed: () {
                                    formKey.currentState!.save();
                                    if (formKey.currentState!.validate()) {
                                      Get.to(() => UserDashboard());
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 66, 66),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: const Text("Login"),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String? loginPassValidation(value) {
  if (value!.isEmpty) {
    return 'Enter password';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters';
  } else if (!RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(value)) {
    return 'Password should have at atleast 1 letter, 1 number, 1 special character';
  }
  return null;
}

String? loginUserNameValidation(value) {
  if (value!.isEmpty) {
    return 'Enter Username';
  } else if (value.length < 5) {
    return 'Enter the valid Username';
  }
  return null;
}
