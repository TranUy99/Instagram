import 'package:cloud_firestore/cloud_firestore.dart';

class Home {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  Future<void> likePost(String postId, String uid, List likes) async {
   
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
   
    } catch (err) {
       err.toString();
    }
    
  }

    // Delete Post
  Future<void> deletePost(String postId) async {
   
    try {
      await _firestore.collection('posts').doc(postId).delete();
      
    } catch (err) {
       err.toString();
    }
    
  }

}
