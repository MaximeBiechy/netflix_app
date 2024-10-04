import 'package:bloc/bloc.dart';
import 'package:netflix_app/features/movies/actors/domain/repository/actor_repository.dart';

import '../../../../../core/service_locator.dart';
import '../../domain/entities/actor.dart';

part 'actor_state.dart';

class ActorCubit extends Cubit<ActorState> {

  ActorCubit() : super(ActorLoading());

  void fetchActors(int movieId) async {
    var actors = await sl<ActorRepository>().getMovieCredit(movieId);
    actors.fold(
      (failure) => emit(ActorError(failure)),
      (actors) => emit(ActorLoaded(actors: actors)),
    );
  }
}