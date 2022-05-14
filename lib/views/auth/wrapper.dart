import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_product/views/auth/login_1.dart';

import 'base_64.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Wrapper'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () => Get.to(() => LoginPage1()),
              child: const Text('Login'),
            ),
            RaisedButton(
              onPressed: () => Get.to(() => TakePictureScreen()),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
