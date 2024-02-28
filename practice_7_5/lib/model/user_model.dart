abstract class UserModelBase {}

class UserModelLoading extends UserModelBase {}

class UserModelEmpty extends UserModelBase {}

class UserModelError extends UserModelBase {
  final String error;
  UserModelError(this.error);
}

class UserModel extends UserModelBase {
  final String name;
  final String email;
  UserModel({
    required this.name,
    required this.email,
  });

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
