import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/configs/theme/app_colors.dart';
import 'package:netflix_app/features/movies/actors/domain/entities/actor.dart';
import 'package:netflix_app/features/movies/actors/presentation/bloc/movies_by_actor_cubit.dart';
import 'package:netflix_app/features/movies/presentation/widgets/movie_preview.dart';
import 'package:netflix_app/features/movies/presentation/widgets/movies_list.dart';

class ActorMoviesPage extends StatelessWidget {
  final Actor actor;

  const ActorMoviesPage({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MoviesByActorCubit()..fetchActorMovies(actor.id),
        child: BlocBuilder<MoviesByActorCubit, MoviesByActorState>(
          builder: (context, state) {
            if (state is MoviesByActorLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is MoviesByActorLoaded) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  title: Text(actor.name, style: Theme.of(context).textTheme.titleMedium,),
                ),
                body: MoviesList(movies: state.movies),
              );
            } else if (state is MoviesByActorError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ));
  }
}
