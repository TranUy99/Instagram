import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserDTO {
  @JsonKey(name: 'uid')
  final int? id;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'fullName')
  final String? fullName;

  @JsonKey(name: 'birthDay')
  final String? birthday;



  UserDTO({
    this.id,
    this.gender,
    this.email,
    this.fullName,
    this.birthday,
   
  
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}