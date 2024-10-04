import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:netflix_app/features/movies/data/data_sources/tmdb_api_service.dart';
import 'package:netflix_app/features/movies/domain/usecases/get_popular_movies.dart';

import '../features/movies/actors/data/repositories/actor_repository_impl.dart';
import '../features/movies/actors/domain/repository/actor_repository.dart';
import '../features/movies/actors/domain/usecases/get_movie_credit.dart';
import '../features/movies/data/repositories/movie_repository_impl.dart';
import '../features/movies/domain/repositories/movie_repository.dart';
import '../features/movies/domain/usecases/get_movie_details.dart';

final sl = GetIt.instance;

Future<void> initializeServiceLocator() async {
  // ! External
  sl.registerLazySingleton<Dio>(() => Dio());
  // ! Services
  sl.registerLazySingleton<TMDBApiService>(() => TMDBApiServiceImpl(sl<Dio>()));
  // ! Repositories
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());
  sl.registerLazySingleton<ActorRepository>(() => ActorRepositoryImpl());
  // ! Use cases
  sl.registerLazySingleton<GetPopularMovies>(() => GetPopularMovies());
  sl.registerLazySingleton<GetMovieDetails>(() => GetMovieDetails());
  sl.registerLazySingleton<GetMovieCredit>(() => GetMovieCredit());

}
