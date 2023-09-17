part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.logIn(String email, String password) = _LogIn;

  const factory AuthEvent.signUp(String email, String password) = _SignUp;

  const factory AuthEvent.signOut() = _SignOut;

  const factory AuthEvent.deleteAccount() = _DeleteAccount;

  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
}
