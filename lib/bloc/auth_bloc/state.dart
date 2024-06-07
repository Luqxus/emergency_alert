import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoggingOut extends AuthenticationState {}
