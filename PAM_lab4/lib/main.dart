import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/bindings/home_binding.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PAM Lab 4',
      initialBinding: HomeBinding(),
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      ),
    );
  }
}
