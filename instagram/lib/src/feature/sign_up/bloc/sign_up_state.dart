class SignUpState {
  final String email;
  final String password;
  final String username;
  final String bio;

  const SignUpState({
    required this.email,
    required this.password,
    required this.username,
    required this.bio,
  });
  SignUpState copyWith({
    String? email,
    String? password,
    String? username,
    String? bio,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      bio: bio ?? this.bio,
    );
  }
}
