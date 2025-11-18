import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/home_binding.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab 3',
      initialBinding: HomeBinding(),
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      ),
    );
  }
}
