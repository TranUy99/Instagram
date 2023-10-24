// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      id: json['uid'] as String?,
      gender: json['gender'] as int?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      birthday: json['birthDay'] as String?,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'uid': instance.id,
      'gender': instance.gender,
      'email': instance.email,
      'username': instance.username,
      'birthDay': instance.birthday,
      'photoUrl': instance.photoUrl,
    };
