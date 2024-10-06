import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import 'movie_preview.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  const MoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MoviePreview(movie: movies[index]);
        },
      ),
    );
  }
}
