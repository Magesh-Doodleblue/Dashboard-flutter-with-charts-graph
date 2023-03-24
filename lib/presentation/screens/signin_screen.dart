// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Dashboard.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
            child: SingleChildScrollView(
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
                            key: _formKey,
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
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
                                  height: 10,
                                ),
                                Text(
                                  "Signin",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]),
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
                                    controller: firstNameController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "First name",
                                    ),
                                    validator: signinFirstNameValidation,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                                    controller: middleController,
                                    validator: signinMiddleNameValidation,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter middle Name",
                                    ),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    onChanged: (value) {},
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
                                    controller: lastController,
                                    validator: signinLastNameValidation,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Last Name",
                                    ),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    onChanged: (value) {},
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
                                    controller: emailController,
                                    validator: signinEmailValidation,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                    ),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    onChanged: (value) {},
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
                                    validator: signinPassValidation,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                    ),
                                    obscureText: true,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    onChanged: (value) {},
                                  ),
                                ),
                                const SizedBox(height: 32),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 64,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _formKey.currentState!.save();
                                      if (_formKey.currentState!.validate()) {
                                        Get.to(const MainScreen());
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 66, 66),
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
          ),
        ],
      ),
    );
  }
}

String? signinEmailValidation(value) {
  if (value!.isEmpty) {
    return 'Enter email address';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$') //check one @ and 1 .
      .hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    int atSignCount = value.split('@').length - 1;
    int dotCount = value.split('.').length - 1;
    if (atSignCount != 1 || dotCount != 1) {
      return 'Email address must contain exactly one @ and one .';
    }
  }
  return null;
}

String? signinFirstNameValidation(value) {
  if (value!.isEmpty) {
    return 'You forgot to give Username';
  } else if (value.length < 5) {
    return 'Enter the valid Username';
  }
  return null;
}

String? signinMiddleNameValidation(value) {
  if (value!.isEmpty) {
    return 'You forgot to give Username';
  } else if (value.length < 5) {
    return 'Enter the valid Username';
  }
  return null;
}

String? signinLastNameValidation(value) {
  if (value!.isEmpty) {
    return 'You forgot to give Username';
  } else if (value.length < 5) {
    return 'Enter the valid Username';
  }
  return null;
}

String? signinPhoneValidation(value) {
  if (value!.isEmpty) {
    return 'You forgot to enter phone number';
  } else if (value.length != 10) {
    return 'Phone should have 10 Digits';
  } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
    return 'Enter a valid phone number';
  }
  return null;
}

String? signinPassValidation(value) {
  if (value!.isEmpty) {
    return 'You forgot to enter password';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters';
  } else if (!RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(value)) {
    return 'Password should have at @1least 1 letter, 1 number, 1 special character';
  }
  return null;
}
