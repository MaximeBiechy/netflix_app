import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix_app/core/configs/env/app_config.dart';
import 'package:netflix_app/features/movies/data/models/movie_model.dart';
import 'package:netflix_app/features/movies/domain/entities/movie.dart';

abstract class TMDBApiService {
  Future<Either> getPopularMovies();
}

class TMDBApiServiceImpl extends TMDBApiService {
  final Dio _dio;

  TMDBApiServiceImpl(this._dio);

  @override
  Future<Either> getPopularMovies() async {
    try {
      List<Movie> movies = [];

      final response = await _dio.get(
        '${AppConfig.baseApiUrl}/movie/popular',
        queryParameters: {
          'api_key': AppConfig.apiKey,
        },
      );

      for (var movie in response.data['results']) {
        var movieModel = MovieModel.fromJson(movie);
        movies.add(movieModel.toEntity());
      }

      return Right(movies);
    } catch (e) {
      return Left("An error occurred while fetching popular movies");
    }
  }
}