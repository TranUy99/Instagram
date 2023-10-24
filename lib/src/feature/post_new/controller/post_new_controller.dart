// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/feature/login/view/login.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../constant/resources/storage_methods.dart';
import '../../../core/model/user.dart';
import '../../home/controller/user_repository .dart';
import '../bloc/post_new_bloc.dart';
import 'package:uuid/uuid.dart';

class PostNewController {
  final BuildContext context;
  PostNewController({required this.context});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> postNew() async {
    bool postSuccess = false; // Custom flag for registration success

    try {
      final state = context.read<PostNewBloc>().state;
      UserDTO userDTO = await UserRepository().getUserDetails();
      String description = state.description;

      if (description.isEmpty || state.file == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please enter all the fields"),
          ),
        );
        return;
      } else {
        try {
          String photoUrl = await StorageMethods().uploadImageToStorage('posts', state.file, true);
          String postId = const Uuid().v1();
          await _firestore.collection('posts').doc(postId).set({
            "description": description,
            "uid": userDTO.id,
            "username": userDTO.username,
            "likes": [],
            "postId": postId,
            "datePublished": DateTime.now(),
            "postUrl": photoUrl,
            "profImage": userDTO.photoUrl,
          });

          postSuccess = true;
        } catch (e) {}
      }
    } catch (e) {}

    if (postSuccess) {
      
      showTopSnackBar(
          Overlay.of(context), const CustomSnackBar.success(message: 'Post Success'));
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
    } else {
      showTopSnackBar(Overlay.of(context), const CustomSnackBar.error(message: 'Post failed'));
    }
  }
}
