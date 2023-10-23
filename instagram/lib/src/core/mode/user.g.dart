// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      id: json['uid'] as int?,
      gender: json['gender'] as int?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      birthday: json['birthDay'] as String?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'uid': instance.id,
      'gender': instance.gender,
      'email': instance.email,
      'fullName': instance.fullName,
      'birthDay': instance.birthday,
    };
