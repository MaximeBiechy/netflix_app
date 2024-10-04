import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getPopularMovies();
  Future<Either> getMovieDetails(int movieId);
}