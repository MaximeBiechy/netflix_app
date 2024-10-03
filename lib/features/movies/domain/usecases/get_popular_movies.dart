import 'package:dartz/dartz.dart';
import 'package:netflix_app/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/service_locator.dart';

class GetPopularMovies implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getPopularMovies();
  }
}