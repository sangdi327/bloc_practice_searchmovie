import 'package:cubitbloc_practice_searchmovie/bloc/movie_bloc.dart';
import 'package:cubitbloc_practice_searchmovie/repository/movie_repository.dart';
import 'package:cubitbloc_practice_searchmovie/view/search_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
        create: (context) => MovieRepository(),
        child: BlocProvider(
          create: (context) => MovieBloc(
            context.read<MovieRepository>(),
          ),
          child: const SearchApp(),
        ),
      ),
    );
  }
}
