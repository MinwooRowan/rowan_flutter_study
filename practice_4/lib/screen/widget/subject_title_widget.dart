import 'package:flutter/material.dart';
import 'package:practice_4/constant/color.dart';

class SubjectTitleWidget extends StatelessWidget {
  final String title;
  const SubjectTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 16,
          decoration: const BoxDecoration(
            color: ColorTheme.primary,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
