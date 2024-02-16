import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '데이터를 불러오는데 실패했습니다 :(',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
