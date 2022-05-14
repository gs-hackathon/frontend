import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_product/views/user_views/user_home_page.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
          ),
          RaisedButton(
            onPressed: () => Get.to(() => HomePage()),
            child: const Text('Login'),
          )
        ],
      )),
    );
  }
}
