import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deelze/features/auth/domain/repository/user_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServive {
  AuthServive({required this.userStorageService});

  final UserStorageService userStorageService;
  User? user;
  String? verificationId;
  String verificationID = "";
  String smsCode = "666666";

  Future<void> sendOtp(
    String phoneNumber,
    Duration timeOut,
    void Function(PhoneAuthCredential) verificationCompleted,
    void Function(FirebaseAuthException) verificationFailed,
    void Function(String, int?) codeSent,
    void Function(String) codeAutoRetrievalTimeout,
  ) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: timeOut,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      print(e);
    }
  }

  Future<void> verifyOTPCode(String verificationId, String smsCode) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await auth
          .signInWithCredential(credential)
          .then((value) => print('User Login In Successful'));
    } catch (e) {
      print(e);
    }
  }

  // verify and login code
  Future<UserCredential?> verifyAndLogin(
      String verificationId, String smsCode) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      return await auth.signInWithCredential(authCredential);
    } catch (e) {
      print(e);
    }
    return null;
  }

  // add new user to colledtion of Users
  Future<void> addUser(
    String? phone,
    String? name,
    String? email,
    int? age,
  ) async {
    try {} catch (e) {
      print(e);
    }
    // final FirebaseFirestore firestore = FirebaseFirestore.instance;
    // final CollectionReference usersCollection =
    //     firestore.collection("Dealze_User");
    // Map<String, dynamic> userData = {
    //   "phone": phone,
    //   "name": name,
    //   "email": email,
    //   "age": age,
    // };
    // // // add user to collection
    // try {
    //   usersCollection
    //       .add(userData)
    //       .then((value) => print("User added with ID: ${value.id}"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<bool> doesUserExist(String phoneNumber) async {
    final usersCollection =
        FirebaseFirestore.instance.collection("Dealze_User");
    final querySnapshot =
        await usersCollection.where("phone", isEqualTo: phoneNumber).get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> updateUserProfile({
    String? name,
    String? email,
    String? phone,
  }) async {
    await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    if (email != null) {
      await FirebaseAuth.instance.currentUser?.updateEmail(email);
    }
    // await FirebaseAuth.instance.currentUser?.updatePhoneNumber(PhoneAuthCredential);
  }

  Future<void> signOut() async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signOut();
      await userStorageService.clearAuthStatus();
      print("Signed out");
    } catch (e) {
      print("User Couldn't be Sign out: $e");
    }
  }
}
