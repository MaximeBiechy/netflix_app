import 'package:bloc/bloc.dart';
import 'package:netflix_app/features/movies/actors/domain/entities/actor.dart';

import '../../../../../core/service_locator.dart';
import '../../../domain/entities/movie.dart';
import '../../domain/repository/actor_repository.dart';

part 'movies_by_actor_state.dart';

class MoviesByActorCubit extends Cubit<MoviesByActorState> {
  MoviesByActorCubit() : super(MoviesByActorLoading());

  void fetchActorMovies(int actorId) async {
    var movies = await sl<ActorRepository>().getMoviesByActor(actorId);
    movies.fold(
      (failure) => emit(MoviesByActorError(failure)),
      (movies) => emit(MoviesByActorLoaded(movies: movies)),
    );

  }
}
