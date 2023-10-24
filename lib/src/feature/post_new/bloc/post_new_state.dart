part of 'post_new_bloc.dart';


class PostNewState {
  final String uid;
  final String username;
  final String profImage;
  final String description;
  final Uint8List file; 
  const PostNewState({
    required this.uid,
    required this.username,
    required this.profImage,
    required this.description,
    required this.file, 
  });

  PostNewState copyWith({
    String? uid,
    String? username,
    String? profImage,
    String? description,
    Uint8List? file,
  }) {
    return PostNewState(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      profImage: profImage ?? this.profImage,
      description: description ?? this.description,
      file: file ?? this.file,
    );
  }
}