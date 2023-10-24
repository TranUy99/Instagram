part of 'post_new_bloc.dart';


abstract class PostNewEvent {
  const PostNewEvent();
}
class FileEvent extends PostNewEvent {
  final  Uint8List file;
  const FileEvent({required this.file});
}

class UidEvent extends PostNewEvent {
  final String uid;
  const UidEvent({required this.uid});
}

class UserNameEvent extends PostNewEvent {
  final String username;
  const UserNameEvent({required this.username});
}

class ProfImageEvent extends PostNewEvent {
  final String profImage;
  const ProfImageEvent({required this.profImage});
}

class DescriptionEvent extends PostNewEvent {
  final String description;
  const DescriptionEvent({required this.description});
}

