import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/usecase/usecase.dart';

import '../../../../core/service_locator.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetails implements UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getMovieDetails(params!);
  }

}