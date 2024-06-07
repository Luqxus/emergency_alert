import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_finite/bloc/auth_bloc/event.dart';
import 'package:in_finite/bloc/auth_bloc/state.dart';
import 'package:in_finite/storage/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SecureStorage storage;
  AuthenticationBloc({required this.storage})
      : super(AuthenticationUninitialized()) {
    on<AppStartedEvent>(_appStarted);
    on<OnboardingCompletedEvent>(_initialize);
    on<LoggedOutEvent>(_loggedOut);
    on<LoggedInEvent>(_loggedIn);
    on<UserDeletedEvent>(_userDeleted);
  }

  _initialize(AuthenticationEvent event, Emitter emit) async {
    if (await storage.hasToken()) {
      emit(AuthenticationAuthenticated());
      return;
    }

    emit(AuthenticationUnauthenticated());
  }

  _appStarted(AppStartedEvent event, Emitter emit) async {
    await _cleanIfFirstUseAfterInstall();

    _initialize(event, emit);
  }

  _loggedOut(LoggedOutEvent event, Emitter emit) async {
    emit(AuthenticationLoggingOut());
    await storage.deleteToken();
    emit(AuthenticationUnauthenticated());
  }

  _loggedIn(LoggedInEvent event, Emitter emit) async {
    emit(AuthenticationLoading());
    await storage.persistEmailAndToken(event.email, event.token);
    emit(AuthenticationAuthenticated());
  }

  _userDeleted(UserDeletedEvent event, Emitter emit) async {
    await storage.deleteAll();

    emit(AuthenticationUnauthenticated());
  }

  _cleanIfFirstUseAfterInstall() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('first_run') ?? true) {
      await storage.deleteAll();
      await prefs.setBool('first_run', false);
    }
  }
}
