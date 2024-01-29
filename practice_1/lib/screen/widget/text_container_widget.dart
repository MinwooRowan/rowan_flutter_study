import 'package:flutter/material.dart';
import 'package:practice_1/constant/color_constant.dart';

class TextColumnContainer extends StatelessWidget {
  final String titleText;
  final String valueText;
  const TextColumnContainer({
    super.key,
    required this.titleText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorConstant.containerColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleText,
            style: const TextStyle(
              color: ColorConstant.greenColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            valueText,
            style: const TextStyle(
              color: ColorConstant.orangeColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
