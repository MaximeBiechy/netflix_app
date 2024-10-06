import 'package:netflix_app/features/movies/domain/entities/movie.dart';

class MovieModel {
  int ? id;
  String ? title;
  String ? overview;
  String ? posterPath;
  String ? releaseDate;
  String ? backdropPath;
  List<String> ? genres;
  int ? runtime;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.backdropPath,
    this.genres,
    this.runtime,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      title = json['title'];
      overview = json['overview'];
      posterPath = json['poster_path'];
      releaseDate = json['release_date'];
      backdropPath = json['backdrop_path'];
      genres = (json['genres'] as List<dynamic>?)
          ?.map((genre) => genre['name'] as String)
          .toList();
      runtime = json['runtime'];
  }

  Movie toEntity() {
    return Movie(
      id: id!,
      title: title ?? 'Unknown',
      overview: overview ?? 'Unknown',
      posterPath: posterPath ?? '',
      releaseDate: releaseDate ?? 'Unknown',
      backdropPath: backdropPath ?? '',
      genres: genres,
      runtime: runtime,
    );
  }



}