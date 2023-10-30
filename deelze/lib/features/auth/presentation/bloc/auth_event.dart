part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.logIn(String email, String password) = _LogIn;
  const factory AuthEvent.signUp(String email, String password) = _SignUp;
  const factory AuthEvent.signOut() = _SignOut;
  const factory AuthEvent.deleteAccount() = _DeleteAccount;
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory AuthEvent.enterPhone(String? phone) = _EnterPhone;
  const factory AuthEvent.enterCode(String code) = _EnterCode;
  const factory AuthEvent.sendOpt(String? phone) = _SendOPT;
  const factory AuthEvent.verifyOpt(String? phone) = _VerifyOPT;
  const factory AuthEvent.addUserToCollection() = _AddUserToCollection;
}
