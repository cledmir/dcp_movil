import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dcp_movil/common/entities/user.dart';
import 'package:dcp_movil/common/widgets/flutter_toast.dart';
import 'package:dcp_movil/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
    }
    if (email.isEmpty) {
      toastInfo(msg: "your email can not be empty");
    }
    if (password.isEmpty) {
      toastInfo(msg: "Your password can not be empty");
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        LoginRequestEntity loginRequestEntity = LoginRequestEntity();

        loginRequestEntity.name = userName;
        loginRequestEntity.email = email;
        loginRequestEntity.type = 1;
        loginRequestEntity.uid = credential.user?.uid;

        await asyncPostAllData(loginRequestEntity);
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent to your register email. To activate it please check your email box and click on the link");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email is invalid");
      }
    }
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    FirebaseFirestore.instance
        .collection("users")
        .doc(loginRequestEntity.uid)
        .set(loginRequestEntity.toFirestore());
  }
}
