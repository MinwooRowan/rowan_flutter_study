import 'package:practice_7_5/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
class User extends _$User {
  @override
  AsyncValue<UserModel> build() {
    return const AsyncValue.loading();
  }

  // 성공적으로 데이터를 받아오는 메소드
  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    state =
        AsyncValue.data(UserModel(name: 'John Doe', email: 'rowan@gmail.com'));
  }

  // 에러가 발생하고, 해당 에러를 AsyncError로 처리하는 메소드
  Future<void> fetchError() async {
    await Future.delayed(const Duration(seconds: 1));
    state = AsyncValue.error('An error occurred', StackTrace.current);
  }

  void setNewName({required String newName}) {
    if (state.value is! UserModel) return;
    state = AsyncValue.data(state.value!.copyWith(name: newName));
  }
}
