// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../../../../main.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class LoginController {
  
//   final BuildContext context;
//    LoginController({required this.context});


//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   void handleLogin() async {  
    
//     try {
     
//         final state = context.read<LoginBloc>().state;
//         String email = state.email;
//         String password = state.password;
//         if (email.isEmpty) {
//           // Xử lý email trống
//         }
//         if (password.isEmpty) {
//           // Xử lý mật khẩu trống
//         } else {
//           try {
            
//             // final loginResponse = await LoginService.loginService(email, password);
//             // if (loginResponse.errCode == 0) {
         
//             //   showTopSnackBar(
//             //       Overlay.of(context), const CustomSnackBar.success(message: 'Login Success'));
//             //   Navigator.pushReplacement(
//             //       context, MaterialPageRoute(builder: (context) => const Application()));
//             // } else {
//             //   showTopSnackBar(Overlay.of(context),
//             //       const CustomSnackBar.error(message: 'Wrong email or password'));
//             // }
//           } catch (e) {}
        
//       }
//     } catch (e) {
//       // Xử lý lỗi khác (nếu có)
//     }
//   }
// }