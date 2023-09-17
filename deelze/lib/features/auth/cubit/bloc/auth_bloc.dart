import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        logIn: (String email, String password) async {},
        signUp: (String email, String password) async {},
        signOut: () async {},
        deleteAccount: () async {},
        checkAuthStatus: () async {
          try {
            final authStatus = await false;
            if (authStatus) {
              emit(AuthState.loggedIn());
            } else {
              emit(AuthState.loggedOut());
            }
          } catch (e) {
            emit(AuthState.failure(e.toString()));
          }
        },
      );
    });
  }
}
