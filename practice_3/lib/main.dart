import 'package:flutter/material.dart';
import 'package:practice_3/screen/grid_view_screen.dart';
import 'package:practice_3/screen/homework3.dart';
import 'package:practice_3/screen/list_view_builder_screen.dart';
import 'package:practice_3/screen/list_view_screen.dart';
import 'package:practice_3/screen/toggle_button_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeWork3(),
      // home: ListViewBuilderScreen(),
      // home: ListViewScreen(),
      // home: ToggleButtonScreen(),
    );
  }
}
