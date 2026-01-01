import 'package:flutter/material.dart';
import 'login_screen.dart'; // استيراد شاشة تسجيل الدخول

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.brown),
      home: LoginScreen(), // البداية من هنا [cite: 11]
    );
  }
}