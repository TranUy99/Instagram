import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String description;
  final Timestamp datePublished;
  final String username;
  final List<String> likes;
  final String postId;
  final String profImage;
  final String uid;
  final String postUrl;

  PostModel({
    required this.description,
    required this.datePublished,
    required this.username,
    required this.likes,
    required this.postId,
    required this.profImage,
    required this.uid,
    required this.postUrl,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      description: map['description'],
      datePublished: map['datePublished'],
      username: map['username'],
      likes: List<String>.from(map['likes']),
      postId: map['postId'],
      profImage: map['profImage'],
      uid: map['uid'],
      postUrl: map['postUrl'],
    );
  }
}
