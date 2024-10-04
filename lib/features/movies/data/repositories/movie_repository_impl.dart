import 'package:dartz/dartz.dart';
import 'package:netflix_app/features/movies/data/data_sources/tmdb_api_service.dart';
import 'package:netflix_app/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {

  @override
  Future<Either> getPopularMovies() async {
    return await sl<TMDBApiService>().getPopularMovies();
  }

  @override
  Future<Either> getMovieDetails(int movieId) async {
    return await sl<TMDBApiService>().getMovieDetails(movieId);
  }
}