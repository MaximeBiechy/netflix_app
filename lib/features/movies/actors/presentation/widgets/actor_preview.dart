import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/configs/env/app_config.dart';

import '../../domain/entities/actor.dart';

class ActorPreview extends StatelessWidget {
  final Actor actor;

  const ActorPreview(this.actor, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            '${AppConfig.imageBaseUrl}${actor.profilePath}'),
      ),
      title: Text(actor.name, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(actor.character, style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
