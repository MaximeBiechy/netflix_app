import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/features/movies/domain/entities/movie.dart';
import 'package:netflix_app/features/movies/presentation/widgets/movie_preview.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../bloc/popular_movies_cubit.dart';

class MovieSection extends StatelessWidget {
  const MovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PopularMoviesCubit()..fetchPopularMovies(),
      child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMoviesLoading) {
            return Center(child: CircularProgressIndicator(color: AppColors.primary));
          } else if (state is PopularMoviesLoaded) {
            return _buildHorizontalMovieList(state.movies);
          } else if (state is PopularMoviesLoadFailure) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No movies found'));
          }
        },
      ),
    );
  }

  Widget _buildHorizontalMovieList(List<Movie> movies) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: MoviePreview(
                  movie: movie), // ! This is the MoviePreview widget
            );
          },
        ),
      ),
    );
  }
}
