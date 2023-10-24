import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  final String commentId;
  final Timestamp datePublished;
  final String username;

  final String text;
  final String profilePic;
  final String uid;

  CommentModel({
    required this.commentId,
    required this.datePublished,
    required this.username,
    required this.profilePic,
    required this.uid,
    required this.text,
  });

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentId: map['commentId'],
      datePublished: map['datePublished'],
      username: map['username'],
      profilePic: map['profilePic'],
      text: map['text'],
      uid: map['uid'],
    );
  }
}
