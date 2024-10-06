import 'package:dartz/dartz.dart';

abstract class ActorRepository {
  Future<Either> getMovieCredit(int movieId);
  Future<Either> getMoviesByActor(int actorId);
}