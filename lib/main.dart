import 'package:flutter/material.dart';
import 'package:scholarship_app/screens/home_screen.dart';
import 'package:scholarship_app/utils/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scholarly',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBackground,
        fontFamily: "Poppins"
      ),
      home: const HomeScreen(),
    );
  }
}
