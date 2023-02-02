import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:recies/pages/Home/HomePage.dart';
import 'package:recies/pages/auth%20Pages/signIn.dart';
import 'package:recies/pages/auth%20Pages/signUp.dart';
import 'package:recies/pages/recipy_page/foodRecipy.dart';

//hello world

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
