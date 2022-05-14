import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_product/views/user_views/user_home_page.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
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
              labelText: 'User ID',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
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
