part of 'movies_by_actor_cubit.dart';

abstract class MoviesByActorState {}

class MoviesByActorLoading extends MoviesByActorState {}

class MoviesByActorLoaded extends MoviesByActorState {
  final List<Movie> movies;
  MoviesByActorLoaded({required this.movies});
}

class MoviesByActorError extends MoviesByActorState {
  final String message;
  MoviesByActorError(this.message);
}