import 'package:practice_7_5/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class User extends _$User {
  @override
  AsyncValue<UserModel> build() {
    return const AsyncValue.loading();
  }

  // 데이터를 받아오는 메소드
  Future<void> fetchData() async {
    state = const AsyncValue.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = AsyncValue.data(
          UserModel(name: 'John Doe', email: 'rowan@gmail.com'));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.fromString(e.toString()));
    }
  }

  void setNewName({required String newName}) {
    if (state.value is! UserModel) return;
    state = AsyncValue.data(state.value!.copyWith(name: newName));
  }
}
