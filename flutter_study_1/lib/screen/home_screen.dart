import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context is the current BuildContext
    // UI트리구조의 현재 위치를 알려주는 중요한 객체
    // 페이지 별 관리가 필요해질때마다 Scaffold를 사용한다.
    return Scaffold(
      backgroundColor: const Color(0xFFFEFBE8),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mail),
            )
          ]),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/egg.png',
              // width: 100,
            ),
            const CustomCounter(),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F8C4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TOTAL TIME',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF77831C),
                    ),
                  ),
                  Text(
                    '30min',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFEA6137),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  @override
  void initState() {
    super.initState();
    print('Counter is initialized');
  }

  @override
  void dispose() {
    print('Counter is disposed');
    super.dispose();
  }

  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: const Text(
                'INCREMENT',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onLongPress: () {
                setState(() {
                  _count = 0;
                });
              },
              onPressed: () {
                setState(() {
                  if (_count > 0) _count--;
                });
              },
              child: const Text(
                'DECREMENT',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          '$_count',
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w800,
            color: Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}
