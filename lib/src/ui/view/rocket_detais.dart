import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rocketsoon/src/domain/rocket.dart';

class RocketDetails extends StatelessWidget {
  final RocketModel rocket;
  const RocketDetails({Key? key, required this.rocket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Nome: ${rocket.rocketName}"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Center(
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  width: double.maxFinite,
                  height: 200.0,
                  imageUrl: rocket.flickrImages.first,
                  placeholder: (context, url) => SizedBox(
                    height: 200.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text("Ativo: ${rocket.active ? "Sim" : "Não"}"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text("Tipo: ${rocket.rocketType}"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text("Empresa: ${rocket.company}"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text("Custo por lançamento: \$${rocket.costPerLaunch}"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text("Descrição: ${rocket.description}"),
            ),
          ],
        ),
      ),
    );
  }
}
