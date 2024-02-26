enum Occupation {
  developer,
  designer,
  planner,
}

class UserInfoModel {
  String? name;
  int? age;
  Occupation? occupation;
  UserInfoModel({
    required this.name,
    required this.age,
    required this.occupation,
  });

  UserInfoModel copyWith({
    String? name,
    int? age,
    Occupation? occupation,
  }) {
    return UserInfoModel(
      name: name ?? this.name,
      age: age ?? this.age,
      occupation: occupation ?? this.occupation,
    );
  }
}
