import 'package:dartz/dartz.dart';
import 'package:netflix_app/features/movies/actors/domain/repository/actor_repository.dart';

import '../../../../../core/service_locator.dart';
import '../../../../../core/usecase/usecase.dart';

class GetMovieCredit implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ActorRepository>().getMovieCredit(params);
  }
}