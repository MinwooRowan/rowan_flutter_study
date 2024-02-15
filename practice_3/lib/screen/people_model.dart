class PeopleModel {
  final String userName;
  final String profileImagePath;
  final List<FollowerModel> followerList;

  PeopleModel({
    required this.userName,
    required this.profileImagePath,
    required this.followerList,
  });
}

class FollowerModel {
  final String followerName;
  final String followerDate;
  final String followerImagePath;
  final bool onlineStatus;
  final bool isFollowing;
  FollowerModel({
    required this.followerName,
    required this.followerDate,
    required this.followerImagePath,
    required this.onlineStatus,
    required this.isFollowing,
  });
}
