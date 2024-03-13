import 'package:json_annotation/json_annotation.dart';

part 'schemas.g.dart';

@JsonSerializable()
class LeaderBoardResult {
  final String region;
  final List<User> leaders;

  LeaderBoardResult({
    required this.region,
    required this.leaders,
  });

  factory LeaderBoardResult.fromJson(Map<String, dynamic> json) =>
      _$LeaderBoardResultFromJson(json);

  Map<String, dynamic> toJson() => _$LeaderBoardResultToJson(this);
}

@JsonSerializable()
class User {
  final String userId;
  final String name;
  final String profilePic;
  final int points;

  User({
    required this.userId,
    required this.name,
    required this.profilePic,
    required this.points,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class TopLeaders {
  final User first;
  final User second;
  final User third;

  TopLeaders({required this.first, required this.second, required this.third});
}
