import 'package:bloc/bloc.dart';
import 'package:cubitbloc_practice_searchmovie/repository/movie_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends Bloc<MovieEvent, List<String>> {
  MovieRepository movieRepository;
  MovieBloc(this.movieRepository) : super([]) {
    on<MovieEvent>((event, emit) async {
      var result = await movieRepository.getMovieName(event.key);
      emit(result);
    },
        transformer: (events, mapper) => events
            .debounceTime(
              const Duration(milliseconds: 1000),
            )
            .flatMap(mapper));
  }
  @override
  void onTransition(Transition<MovieEvent, List<String>> transition) {
    super.onTransition(transition);
    print(transition);
  }
}

class MovieEvent extends Equatable {
  final String key;
  const MovieEvent(this.key);

  @override
  List<Object?> get props => [key];
}
