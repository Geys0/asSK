import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assk_frontend/blocs/app_bloc.dart';
import 'package:assk_frontend/views/home_view.dart';

void main() {
  runApp(const AsSKApp());
}

class AsSKApp extends StatelessWidget {
  const AsSKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'asSK',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
