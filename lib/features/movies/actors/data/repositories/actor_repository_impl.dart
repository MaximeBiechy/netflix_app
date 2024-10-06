import 'package:dartz/dartz.dart';

import '../../../../../core/service_locator.dart';
import '../../../data/data_sources/tmdb_api_service.dart';
import '../../domain/repository/actor_repository.dart';

class ActorRepositoryImpl extends ActorRepository {
  @override
  Future<Either> getMovieCredit(int movieId) async {
    return await sl<TMDBApiService>().getMovieCredits(movieId);
  }

  @override
  Future<Either> getMoviesByActor(int actorId) async {
    return await sl<TMDBApiService>().getMoviesByActor(actorId);
  }

}