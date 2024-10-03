import 'package:netflix_app/features/movies/domain/entities/movie.dart';

class MovieModel {
  int ? id;
  String ? title;
  String ? overview;
  String ? posterPath;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      title = json['title'];
      overview = json['overview'];
      posterPath = json['poster_path'];
  }

  Movie toEntity() {
    return Movie(
      id: id!,
      title: title!,
      overview: overview!,
      posterPath: posterPath!,
    );
  }



}