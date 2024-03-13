// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderBoardResult _$LeaderBoardResultFromJson(Map<String, dynamic> json) =>
    LeaderBoardResult(
      region: json['region'] as String,
      leaders: (json['leaders'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaderBoardResultToJson(LeaderBoardResult instance) =>
    <String, dynamic>{
      'region': instance.region,
      'leaders': instance.leaders,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as String,
      name: json['name'] as String,
      profilePic: json['profilePic'] as String,
      points: json['points'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'profilePic': instance.profilePic,
      'points': instance.points,
    };
