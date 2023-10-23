// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../main.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/model/user.dart';
import '../../home/view/home.dart';
import '../bloc/login_bloc.dart';

class LoginController {
  final BuildContext context;
  LoginController({required this.context});
  bool loginSuccess = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void handleLogin() async {
    try {
      final state = context.read<LoginBloc>().state;
      String email = state.email;
      String password = state.password;
      if (email.isEmpty) {
        // Xử lý email trống
      }
      if (password.isEmpty) {
        // Xử lý mật khẩu trống
      } else {
        try {
          await _auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          loginSuccess = true;
        } catch (e) {}
      }
    } catch (e) {
      // Xử lý lỗi khác (nếu có)
    }
    if (loginSuccess) {
      showTopSnackBar(Overlay.of(context), const CustomSnackBar.success(message: 'Login Success'));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      showTopSnackBar(Overlay.of(context), const CustomSnackBar.error(message: 'Login failed'));
    }
  }
}
