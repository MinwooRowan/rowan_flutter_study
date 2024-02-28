import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_7_5/case_screen.dart';
import 'package:practice_7_5/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // AsyncValue를 사용하는 예시
      home: HomeScreen(),
      // UserModelBase를 사용하는 예시
      // home: CaseScreen(),
    );
  }
}
