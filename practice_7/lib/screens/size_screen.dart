import 'package:flutter/material.dart';

class SizeScreen extends StatelessWidget {
  const SizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        height: 600,
        child: Center(
          child: GirdOne(),
        ),
      ),
    );
  }
}

class GirdOne extends StatelessWidget {
  const GirdOne({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: const Color(0xFF5F6579),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hlelop',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            'asdasd',
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
