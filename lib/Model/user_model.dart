class UserModel {
  final int contribution;
  final int lastOnlineTimeSeconds;
  final int rating;
  final int friendOfCount;
  final String titlePhoto;
  final String rank;
  final String handle;
  final int maxRating;
  final String avatar;
  final int registrationTimeSeconds;
  final String maxRank;

  UserModel({
    required this.contribution,
    required this.lastOnlineTimeSeconds,
    required this.rating,
    required this.friendOfCount,
    required this.titlePhoto,
    required this.rank,
    required this.handle,
    required this.maxRating,
    required this.avatar,
    required this.registrationTimeSeconds,
    required this.maxRank,
  });
}