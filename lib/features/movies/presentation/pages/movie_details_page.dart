import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/common/widgets/button/basic_app_button.dart';
import 'package:netflix_app/core/configs/theme/app_colors.dart';
import 'package:netflix_app/features/movies/actors/presentation/widgets/actors_list.dart';
import 'package:netflix_app/features/movies/presentation/bloc/movie_details_cubit.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;

  const MovieDetailsPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsCubit()..fetchMovieDetails(movieId),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
            ));
          } else if (state is MovieDetailsLoaded) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
              ),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        'https://image.tmdb.org/t/p/w500${state.movie.backdropPath}'),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.movie.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  state.movie.releaseDate.split("-")[0],
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${state.movie.runtime} min',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            BasicAppButton(
                                onPressed: () {},
                                title: 'Lecture',
                                icon: Icon(Icons.play_arrow_rounded)),
                            SizedBox(height: 8),
                            BasicAppButton(
                                onPressed: () {},
                                title: 'Télécharger',
                                color: Color(0xff1f1f1f),
                                icon: Icon(Icons.file_download_outlined)),
                            SizedBox(height: 8),
                            Text(
                              state.movie.overview,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )),
                    SizedBox(height: 8),
                    Expanded(child: ActorsList(movieId: movieId)),
                  ],
                ),
              ),
            );
          } else if (state is MovieDetailsError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
