import 'package:practice_7/model/user_info_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info_provider.g.dart';

@riverpod
class UserInfo extends _$UserInfo {
  @override
  UserInfoModel? build() {
    return UserInfoModel(
      name: null,
      age: null,
      occupation: null,
    );
  }

  void setName(String name) {
    state = state!.copyWith(name: name);
  }

  void setAge(int age) {
    state = state!.copyWith(age: age);
  }

  void setOccupation(Occupation occupation) {
    state = state!.copyWith(occupation: occupation);
  }
}
