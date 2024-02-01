import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 반복되지 않는 위젯들을 스크롤되는 UI 안에 담고 싶을 때 ListView를 사용한다.
      // 반복되고 공통되는 위젯들을 스크롤되는 UI 안에 담고 싶을 때 ListView.builder를 사용한다.
      // ListView.builder가 ListView보다 더 메모리 성능이 좋고 기능이 많음.
      // (ListView builder 예시 참고)
      body: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          300,
          (index) => Center(child: Text('$index')),
        ),
      ),
    );
  }
}
