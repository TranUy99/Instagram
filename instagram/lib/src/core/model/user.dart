import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserDTO {
  @JsonKey(name: 'uid')
  final String? id;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'birthDay')
  final String? birthday;

  @JsonKey(name: 'photoUrl')
  final String? photoUrl;


  UserDTO({
    this.id,
    this.gender,
    this.email,
    this.username,
    this.birthday,
   this.photoUrl
  
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}