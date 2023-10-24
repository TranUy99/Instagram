part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}
class FileEvent extends SignUpEvent {
  final  Uint8List file;
  const FileEvent({required this.file});
}

class EmailEvent extends SignUpEvent {
  final String email;
  const EmailEvent({required this.email});
}

class PasswordEvent extends SignUpEvent {
  final String password;
  const PasswordEvent({required this.password});
}

class UserNameEvent extends SignUpEvent {
  final String username;
  const UserNameEvent({required this.username});
}

class BioEvent extends SignUpEvent {
  final String bio;
  const BioEvent({required this.bio});
}

