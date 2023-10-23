// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../main.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/sign_up_bloc.dart';

class SignUpController {
  final BuildContext context;
  SignUpController({required this.context});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void handleSignUp() async {
    try {
      final state = context.read<SignUpBloc>().state;
      String email = state.email;
      String password = state.password;
      if (email.isEmpty) {
        // Xử lý email trống
      }
      if (password.isEmpty) {
        // Xử lý mật khẩu trống
      } else {
        try {
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          
          await _firestore.collection("users").doc(cred.user!.uid).set({
            "username": state.username,
            "uid": cred.user!.uid,
            "email": email,
            "bio": state.bio,
            "followers": [],
            "following": [],
          });

          // await _firestore.collection('users').add({
          //   "username": state.username,
          //   "uid": cred.user!.uid,
          //   "email": email,
          //   "bio": state.bio,
          //   "followers": [],
          //   "following": [],
          // });
          // if (cred.user.email) {
          //   showTopSnackBar(
          //       Overlay.of(context), const CustomSnackBar.success(message: 'Login Success'));
          //   // Navigator.pushReplacement(
          //   //     context, MaterialPageRoute(builder: (context) => const Application()));
          // } else {
          //   showTopSnackBar(Overlay.of(context),
          //       const CustomSnackBar.error(message: 'Wrong email or password'));
          // }
        } catch (e) {}
      }
    } catch (e) {
      // Xử lý lỗi khác (nếu có)
    }
  }
}
