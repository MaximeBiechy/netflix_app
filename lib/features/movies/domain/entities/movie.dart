class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String backdropPath;
  // ! Optional parameters
  final List<String>? genres;
  final int? runtime;


  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.backdropPath,
    this.genres,
    this.runtime,
  });
}