import 'package:flutter/material.dart';
import 'package:practice_1/constant/color_constant.dart';
import 'package:practice_1/screen/meal_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColorConstant.orangeColor)),
      home: const MealScreen(),
    );
  }
}
