import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat_app/common/utils/constants.dart';
import 'package:my_chat_app/common/utils/snow_snack_bar.dart';
import 'package:my_chat_app/features/auth/pages/otp_page.dart';
import 'package:my_chat_app/features/auth/pages/user_info_page.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ));

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  void singInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: ((String verficationId, int? resendToken) async {
            Navigator.pushNamed(
              context,
              OTPPage.routeName,
              arguments: verficationId,
            );
          }),
          codeAutoRetrievalTimeout: (String verficationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString(), isError: true);
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInfoPage.routeName,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!, isError: true);
    }
  }

  void saveUserDatatoFirebase({
    required String name,
    required File? profilePic,
    required Ref ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl = defaultImage;

      if (profilePic != null) {}
    } catch (e) {
      showSnackBar(context, e.toString(), isError: true);
    }
  }
}
