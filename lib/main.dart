import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_finite/app_wrapper.dart';
import 'package:in_finite/bloc/auth_bloc/bloc.dart';
import 'package:in_finite/bloc/auth_bloc/event.dart';
import 'package:in_finite/storage/secure_storage.dart';

void main() {
  runApp(
    BlocProvider(
      create: (BuildContext context) => AuthenticationBloc(
        storage: SecureStorage(),
      )..add(AppStartedEvent()),
      child: const InfiniteApp(),
    ),
  );
}

class InfiniteApp extends StatelessWidget {
  const InfiniteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppWrapper(),
    );
  }
}
