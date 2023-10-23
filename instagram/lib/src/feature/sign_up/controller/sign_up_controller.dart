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
import '../../../../main.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/resources/storage_methods.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpController {
  final BuildContext context;
  SignUpController({required this.context});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> handleSignUp() async {
    bool registrationSuccess = false; // Custom flag for registration success

    try {
      final state = context.read<SignUpBloc>().state;
      String email = state.email;
      String password = state.password;
      if (email.isEmpty ||
          password.isEmpty ||
          state.username.isEmpty ||
          state.bio.isEmpty ||
          state.file == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please enter all the fields"),
          ),
        );
        return;
      } else {
        try {
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          String photoUrl =
              await StorageMethods().uploadImageToStorage('profilePics', state.file, false);

          await _firestore.collection("users").doc(cred.user!.uid).set({
            "username": state.username,
            "uid": cred.user!.uid,
            "email": email,
            "photoUrl": photoUrl,
            "bio": state.bio,
            "followers": [],
            "following": [],
          });

          
          registrationSuccess = true;
        } catch (e) {
      
        }
      }
    } catch (e) {
 
    }

    if (registrationSuccess) {
      showTopSnackBar(
          Overlay.of(context), const CustomSnackBar.success(message: 'Register Success'));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } else {
      showTopSnackBar(
          Overlay.of(context), const CustomSnackBar.error(message: 'Register failed'));
    }
  }
}

   // await _firestore.collection('users').add({
          //   "username": state.username,
          //   "uid": cred.user!.uid,
          //   "email": email,
          //   "bio": state.bio,
          //   "followers": [],
          //   "following": [],
          // });