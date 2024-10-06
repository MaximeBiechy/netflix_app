import 'package:flutter/material.dart';
import 'package:netflix_app/core/configs/routes/routes.dart';
import 'package:netflix_app/features/movies/actors/domain/entities/actor.dart';
import 'package:netflix_app/features/movies/presentation/pages/movie_details_page.dart';

import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/movies/actors/presentation/pages/actor_movies_page.dart';
import '../../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.movieDetail:
        final movieId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => MovieDetailsPage(movieId: movieId));
      case Routes.actorMovies:
        final actor = settings.arguments as Actor;
        return MaterialPageRoute(builder: (_) => ActorMoviesPage(actor: actor));
        return null;
      default:
        return null;
    }
  }
}
