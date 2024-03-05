import 'package:practice_7_5/model/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'model_case_provider.g.dart';

@riverpod
class UserCase extends _$UserCase {
  @override
  UserModelBase build() {
    return UserModelLoading();
  }

  Future<void> fetchData() async {
    // 값을 받아오기 시작하면 loading 상태로 변경
    state = UserModelLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      // 값을 받아오는데 성공하면 UserModel로 변경
      state = UserModel(name: 'John Doe', email: 'minwoo@rowan.kr');
    } catch (e) {
      state = UserModelError(e.toString());
    }
  }

  void setNewName({required String newName}) {
    if (state is! UserModel) return;
    state = (state as UserModel).copyWith(name: newName);
  }
}
