import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_reting_app/page/profile/view/profile_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SF-Pro-Display',
      ),
      home: const ProfileScreen(),
    );
  }
}
