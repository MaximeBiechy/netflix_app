import '../../domain/entities/actor.dart';

class ActorModel {
  int ? id;
  String ? name;
  String ? profilePath;
  String ? character;

  ActorModel({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  ActorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePath = json['profile_path'];
    character = json['character'];
  }

  Actor toEntity() {
    return Actor(
      id: id!,
      name: name ?? 'Unknown',
      profilePath: profilePath ?? '',
      character: character ?? 'Unknown',
    );
  }

}
