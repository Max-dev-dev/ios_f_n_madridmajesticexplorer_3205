import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/cubit/places_cubit.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/cubit/quiz_cubit.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PlacesCubit()),
        BlocProvider(create: (context) => QuizCubit()..loadQuestions()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/main_background.png',
                  fit: BoxFit.cover,
                ),
              ),
              child ?? const SizedBox.shrink(),
            ],
          );
        },
        home: const SplashScreen(),
      ),
    );
  }
}
