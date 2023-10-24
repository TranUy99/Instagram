import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_new_event.dart';
part 'post_new_state.dart';

class PostNewBloc extends Bloc<PostNewEvent, PostNewState> {
  PostNewBloc()
      : super(PostNewState(
          uid: "",
          profImage: "",
          username: "",
          description: "",
          file: Uint8List(0),
        )) {
    on<UidEvent>(_uidEvent);
    on<ProfImageEvent>(_profImageEvent);
    on<UserNameEvent>(_usernameEvent);
    on<DescriptionEvent>(_descriptionEvent);
    on<FileEvent>(_fileEvent);
  }

  void _fileEvent(FileEvent event, Emitter<PostNewState> emit) {
    emit(state.copyWith(file: event.file));
  }

  void _uidEvent(UidEvent event, Emitter<PostNewState> emit) {
    emit(state.copyWith(uid: event.uid));
  }

  void _profImageEvent(ProfImageEvent event, Emitter<PostNewState> emit) {
    emit(state.copyWith(profImage: event.profImage));
  }

  void _usernameEvent(UserNameEvent event, Emitter<PostNewState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _descriptionEvent(DescriptionEvent event, Emitter<PostNewState> emit) {
    log("event.description ${event.description}");
    emit(state.copyWith(description: event.description));
  }
}
