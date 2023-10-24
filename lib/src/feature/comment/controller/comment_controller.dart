
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CommentController {
  final BuildContext context;
  CommentController({required this.context});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Post comment
  Future<bool> postComment(
      {required String postId,
      required String text,
      required String uid,
      required String username,
      required String profilePic}) async {
    bool postSuccess = false;
    try {
      if (text.isNotEmpty) {
        // if the likes list contains the user uid, we need to remove it
        String commentId = const Uuid().v1();
        _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
          'profilePic': profilePic,
          'username': username,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        postSuccess = true;
      } else {
        postSuccess = false;
      }
    } catch (err) {
      err.toString();
    }
   
    return postSuccess;
  }
}
