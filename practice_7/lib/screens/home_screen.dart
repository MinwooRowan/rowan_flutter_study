import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_7/provider/user_info_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // HomeScreen이 빌드될때 새로운 TextEditingController를 생성
  late final TextEditingController userNamecontroller;
  late final TextEditingController ageController;

  // initState에서 userNamecontroller를 초기화
  @override
  void initState() {
    super.initState();
    userNamecontroller = TextEditingController();
    ageController = TextEditingController();

    // userNamecontroller의 변경사항을 감지
    userNamecontroller.addListener(() {
      ref.read(userInfoProvider.notifier).setName(userNamecontroller.text);
    });

    // ageController의 변경사항을 감지
    ageController.addListener(() {
      if (ageController.text.isNotEmpty) {
        final lastCharacter = ageController.text.characters.last;
        // 마지막 문자가 숫자인지 확인 (int.tryParse를 사용하여 숫자인지 확인) null이면 숫자가 아닌것
        final lastCharacterValidation = int.tryParse(lastCharacter);

        // 입력된 값이 숫자가 아니면 마지막 문자를 제거
        if (lastCharacterValidation == null && ageController.text.isNotEmpty) {
          ageController.text =
              ageController.text.substring(0, ageController.text.length - 1);
        } else {
          final age = int.tryParse(ageController.text);
          if (age! <= 0) {
            // 0보다 작거나 같으면 0으로 변경
            ageController.text = '0';
          }
          ref.read(userInfoProvider.notifier).setAge(age);
        }
      }
    });
  }

  // dispose에서 userNamecontroller를 해제
  @override
  void dispose() {
    userNamecontroller.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userInfoProvider);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userNamecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                labelText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  labelText: 'Enter your age',
                  hintText: '나이'),
            ),
            const SizedBox(height: 20),
            Text(
                userInfo?.name != null ? 'Name: ${userInfo?.name}' : 'No name'),
            const SizedBox(height: 20),
            Text(userInfo?.age != null ? 'Age: ${userInfo?.age}' : 'No age'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}
