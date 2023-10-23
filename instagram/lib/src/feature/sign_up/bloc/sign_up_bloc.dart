import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:instagram/src/feature/sign_up/bloc/sign_up_state.dart';
part 'sign_up_event.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState(email: "", password: "", username: "", bio: "")) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<UserNameEvent>(_usernameEvent);
    on<BioEvent>(_bioEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpState> emit) {
   
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpState> emit) {
    
    emit(state.copyWith(password: event.password));
  }

  void _usernameEvent(UserNameEvent event, Emitter<SignUpState> emit) {
   
    emit(state.copyWith(username: event.username));
  }

  void _bioEvent(BioEvent event, Emitter<SignUpState> emit) {
    
    emit(state.copyWith(bio: event.bio));
  }
}
