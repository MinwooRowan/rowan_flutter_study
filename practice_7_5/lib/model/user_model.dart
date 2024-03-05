abstract class UserModelBase {
  const UserModelBase();

  void printClassType();

  void printModel() {
    print('UserModel');
  }
}

class UserModelLoading extends UserModelBase {
  const UserModelLoading();

  @override
  void printClassType() {
    print('I am Loading :  ${this.runtimeType.toString()}');
  }
}

class UserModelEmpty extends UserModelBase {
  const UserModelEmpty();

  @override
  void printClassType() {
    print('I am Empty :  ${this.runtimeType.toString()}');
  }
}

class UserModelError extends UserModelBase {
  final String error;

  UserModelError(this.error);

  @override
  void printClassType() {
    print('I am Error :  ${this.runtimeType.toString()}');
  }
}

class UserModel extends UserModelBase {
  final String name;
  final String email;
  UserModel({
    required this.name,
    required this.email,
  });

  @override
  void printClassType() {
    print('I am User :  ${this.runtimeType.toString()}');
  }

  UserModel copyWith({
    String? name,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
