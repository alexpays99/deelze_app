part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.success() = _Success;

  const factory AuthState.failure(String errorMessage) = _Failure;

  const factory AuthState.accountDeleted() = _AccoutDeleted;

  const factory AuthState.loggedIn() = _LoggedIn;

  const factory AuthState.loggedOut() = _LoggedOut;
}
