import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServive {
  User? user;
  String? verificationId;
  String verificationID = "";
  String smsCode = "666666";

  /// send opt
  // Future<void> sendOtp(
  //   String phoneNumber,
  //   Duration timeOut,
  // ) async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   try {
  //     await auth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       timeout: timeOut,
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance.signInWithCredential(credential).then(
  //               (value) => print('Logged In Successfully'),
  //             );
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         if (e.code == 'invalid-phone-number') {
  //           print('The provided phone number is not valid.');
  //         }
  //       },
  //       codeSent: (String verificationId, int? resendToken) async {
  //         verificationID = verificationId;
  //         PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //             verificationId: verificationId, smsCode: smsCode);
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }
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
  Future<UserCredential> verifyAndLogin(
      String verificationId, String smsCode) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    AuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return await auth.signInWithCredential(authCredential);
  }

  // get current authorized user
  Future<User?> getUser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = await auth.currentUser;
    return user;
  }

  Future<bool> isLoggedIn() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final user = _auth.currentUser; //check if user is logged in or not
      return user != null;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
