import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_7_5/model/user_model.dart';
import 'package:practice_7_5/provider/model_case_provider.dart';

class CaseScreen extends ConsumerStatefulWidget {
  const CaseScreen({super.key});

  @override
  ConsumerState<CaseScreen> createState() => _CaseScreenState();
}

class _CaseScreenState extends ConsumerState<CaseScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userCaseProvider.notifier).fetchData();
      // ref.read(userCaseProvider.notifier).fetchError();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userCaseProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                _buildUserState(userState),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    ref.read(userCaseProvider.notifier).setNewName(
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

  Widget _buildUserState(UserModelBase userState) {
    if (userState is UserModel) {
      return Column(
        children: [
          Text('Name: ${userState.name}'),
          Text('Email: ${userState.email}'),
        ],
      );
    } else if (userState is UserModelError) {
      return Text('Error: ${userState.error}');
    } else {
      return const CircularProgressIndicator();
    }
  }
}
