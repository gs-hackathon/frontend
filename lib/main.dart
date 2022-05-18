// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_product/utils/Prefs.dart';
import 'package:waste_product/views/auth/login_screen.dart';
import 'package:waste_product/views/user_views/user_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: buildNavigator(),
    );
  }
}

Widget buildNavigator() {
  var tokenData = /* Prefs.getString("access_token") ??  */"";
  if (tokenData != "") {
    return const UserHomePage();
  } else {
    return const LoginScreen();
  }
}
