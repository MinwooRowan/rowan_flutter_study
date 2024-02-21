import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'name_provider.g.dart';

@riverpod
class UserName extends _$UserName {
  @override
  String build() {
    return 'Minwoo';
  }

  void setNewName({required String newName}) {
    super.state = newName;
  }

  void resetName() {
    state = 'Minwoo';
  }
}
