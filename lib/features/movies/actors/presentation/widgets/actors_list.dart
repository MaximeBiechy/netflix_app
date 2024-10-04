import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/configs/theme/app_colors.dart';

import '../bloc/actor_cubit.dart';

class ActorsList extends StatelessWidget {
  final int movieId;

  const ActorsList({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ActorCubit()..fetchActors(movieId),
        child: BlocBuilder<ActorCubit, ActorState>(
          builder: (context, state) {
            if (state is ActorLoading) {
              return Center(child: CircularProgressIndicator(color: AppColors.primary,));
            } else if (state is ActorLoaded) {
              return ListView.builder(
                itemCount: state.actors.length,
                itemBuilder: (context, index) {
                  final actor = state.actors[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${actor.profilePath}'),
                    ),
                    title: Text(actor.name,),
                    subtitle: Text(actor.character),
                  );
                },
              );
            } else if (state is ActorError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('No actors found'));
          },
        ));
  }
}
