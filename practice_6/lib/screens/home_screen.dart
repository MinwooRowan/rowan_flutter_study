import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_6/provider/name_provider.dart';
import 'package:practice_6/screens/change_text_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userName = ref.watch(userNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangeTextScreem()));
              },
              child: const Text('Go To Another Screen(context)'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(userNameProvider.notifier).resetName();
              },
              child: const Text('Reset Text State'),
            ),
            const SizedBox(height: 20),
            Text(
              userName,
            ),
          ],
        ),
      ),
    );
  }
}
