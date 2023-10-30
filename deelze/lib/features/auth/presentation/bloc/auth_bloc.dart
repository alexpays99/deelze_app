import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deelze/dependencies.dart';
import 'package:deelze/features/auth/domain/repository/aut_service.dart';
import 'package:deelze/features/auth/domain/repository/user_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? phoneNumber;
  final AuthServive _authServive = getIt.get<AuthServive>();
  StreamSubscription? subscription;
  String verificationID = "";
  String smsCode = "666666";

  AuthBloc() : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        logIn: (String email, String password) async {},
        signUp: (String email, String password) async {},
        signOut: () async {
          try {
            await _authServive.signOut();
            emit(const AuthState.loggedOut());
          } catch (e) {
            emit(AuthState.failure(e.toString()));
            print(e);
          }
          emit(const AuthState.initial());
        },
        deleteAccount: () async {},
        checkAuthStatus: () async {
          try {
            bool authStatus = await UserStorageService().getAuthStatus();
            if (authStatus) {
              emit(const AuthState.loggedIn());
            } else {
              emit(const AuthState.loggedOut());
            }
          } catch (e) {
            emit(AuthState.failure(e.toString()));
          }
        },
        enterPhone: (String? phone) {
          phoneNumber = phone;
          print("Pnone number: $phone");
          switch (phone) {
            case null:
              emit(const AuthState.buttonDisable());
            case '':
              emit(const AuthState.buttonDisable());
            default:
              emit(const AuthState.buttonEnable());
          }
        },
        enterCode: (String code) async {
          smsCode = code;
          print("Sms code: $smsCode");
          if (smsCode.length == 5) {
            await _authServive.verifyAndLogin(verificationID, smsCode);
          }
        },
        sendOpt: (phone) async {
          try {
            await _authServive.sendOtp(
              phone ?? '',
              const Duration(seconds: 60),
              (PhoneAuthCredential credential) async {
                // ANDROID ONLY!
                // Sign the user in (or link) with the auto-generated credential
                await FirebaseAuth.instance
                    .signInWithCredential(credential)
                    .then(
                      (value) => print('Logged In Successfully'),
                    );
                emit(const AuthState.loggedIn());
              },
              (FirebaseAuthException e) {
                if (e.code == 'invalid-phone-number') {
                  print('The provided phone number is not valid.');
                  emit(const AuthState.loggedOut());
                }
              },
              (String verificationId, int? resendToken) async {
                // // Update the UI - wait for the user to enter the SMS code
                // // String smsCode = 'xxxx';
                // // Create a PhoneAuthCredential with the code
                verificationID = verificationId;
              },
              (String verificationId) {},
            );
          } catch (e) {
            print(e);
          }
        },
        verifyOpt: (code) async {
          smsCode = "123456";
          try {
            final res =
                await _authServive.verifyAndLogin(verificationID, smsCode);
            if (res != null) {
              await getIt
                  .get<UserStorageService>()
                  .saveAuthStatus(FirebaseAuth.instance.currentUser);
              final isAuthorized =
                  await getIt.get<UserStorageService>().getAuthStatus();
              if (isAuthorized) {
                emit(const AuthState.loggedIn());
              } else {
                emit(const AuthState.loggedOut());
              }
            }
            final userToken =
                await FirebaseAuth.instance.currentUser?.getIdTokenResult();
            log('CURRENT_USER_ACCESS_TOKEN: ${userToken?.token} END');
          } catch (e) {
            emit(const AuthState.loggedOut());
            print(e);
          }
        },
        addUserToCollection: () async {
          final currentUser = FirebaseAuth.instance.currentUser;
          final doesUserExist =
              await _authServive.doesUserExist(phoneNumber ?? "");
          if (!doesUserExist) {
            _authServive.addUser(
              currentUser?.phoneNumber,
              '',
              currentUser?.email ?? '',
              0,
            );
            emit(const AuthState.loggedIn());
          } else {
            emit(const AuthState.loggedIn());
          }
        },
      );
    });
  }
}
