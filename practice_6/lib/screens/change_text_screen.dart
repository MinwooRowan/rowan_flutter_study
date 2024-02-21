import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_6/provider/name_provider.dart';
import 'package:practice_6/screens/home_screen.dart';

class ChangeTextScreem extends ConsumerWidget {
  const ChangeTextScreem({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userName = ref.watch(userNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Text Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: const Text(
                'Go Back To Home Screen',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(userNameProvider.notifier)
                    .setNewName(newName: 'JUN CHEA');
              },
              child: const Text('Change Text State'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              userName,
            ),
          ],
        ),
      ),
    );
  }
}
