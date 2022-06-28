import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rocketsoon/src/domain/rocket.dart';

class RocketComponent extends StatelessWidget {
  final RocketModel rocket;

  const RocketComponent({
    Key? key,
    required this.rocket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(rocket.rocketName),
          Text(rocket.company),
          Text(rocket.country),
          Text(rocket.active ? 'Ativo' : 'inativo'),
          Text("Custo por lançamento: \$${rocket.costPerLaunch}"),
          CachedNetworkImage(
            imageUrl: rocket.flickrImages.first,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
