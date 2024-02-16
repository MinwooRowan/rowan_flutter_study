import 'package:flutter/material.dart';
import 'package:practice_4/constant/color.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  const CustomButtonWidget(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorTheme.primary,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: SizedBox(
            width: 280,
            height: 52,
            child: Center(
                child: Text(
              buttonText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
          ),
        ),
      ),
    );
  }
}
