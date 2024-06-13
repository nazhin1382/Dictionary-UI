import 'package:flutter/material.dart';
import 'package:uiproject/addword.dart';
import 'package:uiproject/favorite.dart';
import 'package:uiproject/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary',
      home: Favorite(),
    );
  }
}
