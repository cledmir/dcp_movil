import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dcp_movil/common/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dcp_movil/common/entities/msg.dart';
import 'package:dcp_movil/common/entities/user.dart';
import 'package:dcp_movil/common/values/constant.dart';
import 'package:dcp_movil/common/widgets/flutter_toast.dart';
import 'package:dcp_movil/global.dart';
import 'package:dcp_movil/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;
  SignInController({required this.context});

  final FirebaseService _firebaseService = FirebaseService.instance;

  Future<void> handleSingIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //
          toastInfo(msg: "You need to fill email address");
          return;
        } else {
          print("email is $emailAddress");
        }
        if (password.isEmpty) {
          //
          toastInfo(msg: "You need to fill password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            toastInfo(msg: "You need to verify your email account");
            return;
          }

          var user = credential.user;
          if (user != null) {
            DocumentSnapshot? userSnapshot =
                await _firebaseService.getUserById(user.uid);
            Map<String, dynamic> userData =
                userSnapshot?.data() as Map<String, dynamic>;
            UserItem loginRequestEntity = UserItem.fromJson(userData);

            Global.storageService.setString(
                AppConstants.STORAGE_USER_PROFILE_ID,
                loginRequestEntity.uid ?? "");
            Global.storageService.setString(
                AppConstants.STORAGE_USER_NAME, loginRequestEntity.name ?? "");
            Global.storageService.setString(
                AppConstants.STORAGE_USER_NAME, loginRequestEntity.name ?? "");
            Global.storageService.setString(AppConstants.STORAGE_USER_PHOTO_URL,
                loginRequestEntity.photoURL ?? "");

            Navigator.of(context)
                .pushNamedAndRemoveUntil("/aplication", (route) => false);
          } else {
            toastInfo(msg: "Currently you are not user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user.");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email is incorrect");
          }
        }
      }
    } catch (e) {}
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    FirebaseFirestore.instance
        .collection("users")
        .doc(loginRequestEntity.email)
        .set(loginRequestEntity.toFirestore());
  }
}
