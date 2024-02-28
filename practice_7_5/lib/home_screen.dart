import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_7_5/provider/user_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userProvider.notifier).fetchData();
      // ref.read(userProvider.notifier).fetchError();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                userState.when(
                  data: (data) {
                    return Column(
                      children: [
                        Text('Name: ${data.name}'),
                        Text('Email: ${data.email}'),
                      ],
                    );
                  },
                  error: (error, stacktrace) {
                    return Text('Error: $error');
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    ref.read(userProvider.notifier).setNewName(
                          newName: 'Minwoo',
                        );
                  },
                  child: const Text(
                    'Change Name',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
