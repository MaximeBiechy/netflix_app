import 'package:bloc/bloc.dart';
import 'package:netflix_app/features/movies/domain/entities/movie.dart';
import 'package:netflix_app/features/movies/domain/usecases/get_popular_movies.dart';

import '../../../../core/service_locator.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {

  PopularMoviesCubit() : super(PopularMoviesLoading());

  Future<void> fetchPopularMovies() async {
    var returnedMovies = await sl<GetPopularMovies>().call();
    returnedMovies.fold(
      (failure) => emit(PopularMoviesLoadFailure(failure)),
      (movies) => emit(PopularMoviesLoaded(movies)),
    );
  }
}
