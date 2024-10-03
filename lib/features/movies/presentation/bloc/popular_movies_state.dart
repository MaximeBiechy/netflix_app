part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> movies;

  PopularMoviesLoaded(this.movies);
}

class PopularMoviesEmpty extends PopularMoviesState {}

class PopularMoviesLoadFailure extends PopularMoviesState {
  final String message;

  PopularMoviesLoadFailure(this.message);
}