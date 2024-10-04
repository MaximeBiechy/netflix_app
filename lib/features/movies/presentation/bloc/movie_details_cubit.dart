import 'package:bloc/bloc.dart';
import 'package:netflix_app/features/movies/domain/entities/movie.dart';
import 'package:netflix_app/features/movies/domain/usecases/get_movie_details.dart';

import '../../../../core/service_locator.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {

  MovieDetailsCubit() : super(MovieDetailsLoading());

  Future<void> fetchMovieDetails(int movieId) async {
    var movieDetails = await sl<GetMovieDetails>().call(params: movieId);
    movieDetails.fold(
      (failure) => emit(MovieDetailsError(failure)),
      (movie) => emit(MovieDetailsLoaded(movie)),
    );
  }
}
