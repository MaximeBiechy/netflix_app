import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/usecase/usecase.dart';

import '../../../../../core/service_locator.dart';
import '../repository/actor_repository.dart';

class GetMoviesByActor implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({params}) async {
    return await sl<ActorRepository>().getMoviesByActor(params);
  }
}