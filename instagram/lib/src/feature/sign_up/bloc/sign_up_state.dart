import 'dart:typed_data';

class SignUpState {
  final String email;
  final String password;
  final String username;
  final String bio;
  final  Uint8List file;
  const SignUpState({
    required this.email,
    required this.password,
    required this.username,
    required this.bio,
    required this.file,
  });
  SignUpState copyWith({
    String? email,
    String? password,
    String? username,
    String? bio,
    Uint8List? file,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      file: file?? this.file,
    );
  }
}
