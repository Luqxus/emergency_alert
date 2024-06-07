import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_finite/bloc/auth_bloc/bloc.dart';
import 'package:in_finite/bloc/auth_bloc/state.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationUninitialized) {
        return const LoadingProgressBar();
      } else if (state is AuthenticationLoading) {
        return const LoadingProgressBar();
      } else if (state is AuthenticationUnauthenticated) {
        return const SignInScreen();
      } else if (state is AuthenticationAuthenticated) {
        return const HomeScreen();
      } else if (state is AuthenticationLoggingOut) {
        return const LoadingProgressBar();
      }

      return const SignInScreen();
    });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class LoadingProgressBar extends StatelessWidget {
  const LoadingProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
