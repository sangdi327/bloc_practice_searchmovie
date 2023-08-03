import 'package:cubitbloc_practice_searchmovie/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  context.read<MovieBloc>().add(MovieEvent(value));
                },
              ),
              Expanded(
                child: BlocBuilder<MovieBloc, List<String>>(
                    builder: (context, state) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(state[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.blueGrey,
                      );
                    },
                    itemCount: state.length,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
