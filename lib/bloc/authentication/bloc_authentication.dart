import 'package:dome/bloc/authentication/bloc_authentication_event.dart';
import 'package:dome/bloc/authentication/bloc_authentication_state.dart';
import 'package:dome/bloc/bloc_event_state.dart';

class AuthenticationBloc
    extends BlocEventStateBase<AuthenticationEvent, AuthenticationState> {
  // #region Constructor
  AuthenticationBloc()
      : super(initialState: AuthenticationState.notAuthenticated());
  // #endregion

  @override
  Stream<AuthenticationState> eventHandler(
    AuthenticationEvent event,
    AuthenticationState state,
  ) async* {
    /// LogIn Process
    if (event is AuthenticationEventLogin) {
      yield AuthenticationState.authenticating();

      // Simulation of a authentication server call
      await Future.delayed(const Duration(seconds: 5));

      if (event.name == "failure")
        yield AuthenticationState.failure();
      else
        yield AuthenticationState.authenticated(event.name);
    }

    /// LogOut Process
    if (event is AuthenticationEventLogout) {
      yield AuthenticationState.notAuthenticated();
    }
  }
}
