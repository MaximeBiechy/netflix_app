part of 'actor_cubit.dart';

abstract class ActorState {}

class ActorLoading extends ActorState {}

class ActorLoaded extends ActorState {
  final List<Actor> actors;
  ActorLoaded({required this.actors});
}

class ActorError extends ActorState {
  final String message;
  ActorError(this.message);
}
