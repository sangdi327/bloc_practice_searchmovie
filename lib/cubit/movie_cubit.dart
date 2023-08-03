import 'package:bloc/bloc.dart';
import 'package:cubitbloc_practice_searchmovie/repository/movie_repository.dart';

class MovieCubit extends Cubit<List<String>> {
  MovieRepository movieRepository;
  MovieCubit(this.movieRepository) : super([]);

  void search(String key) async {
    var result = await movieRepository.getMovieName(key);
    emit(result);
  }

  @override
  void onChange(Change<List<String>> change) {
    super.onChange(change);
    // print(change);
  }
}
