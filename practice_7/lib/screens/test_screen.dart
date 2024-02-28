import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_7/provider/homework7struct.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CommomData commomData = ref.watch(homeWork7StructProvider);
    final PeopleData? peopleData = ref.watch(peopleProvider);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ViewType: ${commomData.viewType}'),
            Text('MyPeopleData: ${peopleData?.name}'),
            Text('LstNowPeopleData: ${commomData.lstNowPeopleData}'),
            Text('LstOldPeopleData: ${commomData.lstOldPeopleData}'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                ref.read(homeWork7StructProvider.notifier).initAllData();
              },
              child: const Text('initAllData'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(homeWork7StructProvider.notifier).setMyPeopleData(
                      PeopleData(
                        imageName: '',
                        name: 'minwoo2',
                        detail: 'Detail',
                        type: UserType.master,
                      ),
                    );
              },
              child: const Text('update peopleData Name'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(homeWork7StructProvider.notifier).insertNowPeopleData(
                      PeopleData(
                        imageName: '',
                        name: 'hello',
                        detail: 'detail',
                        type: UserType.online,
                      ),
                    );
              },
              child: const Text('insertNowPeople'),
            ),
          ],
        ),
      ),
    );
  }
}
