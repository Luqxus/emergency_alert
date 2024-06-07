import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoggedInEvent extends AuthenticationEvent {
  final String email;
  final String token;
  LoggedInEvent({required this.email, required this.token});

  @override
  List<Object?> get props => [email, token];
}

class AppStartedEvent extends AuthenticationEvent {}

class LoggedOutEvent extends AuthenticationEvent {}

class UserDeletedEvent extends AuthenticationEvent {}

class OnboardingCompletedEvent extends AuthenticationEvent {}
