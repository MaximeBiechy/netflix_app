import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/configs/env/app_config.dart';
import 'package:netflix_app/features/movies/domain/entities/movie.dart';

class MoviePreview extends StatelessWidget {
  final Movie movie;

  const MoviePreview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/movie-details', arguments: movie.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          '${AppConfig.imageBaseUrl}${movie.posterPath}',
          width: 130,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
