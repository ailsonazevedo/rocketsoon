import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:rocketsoon/src/application/controllers/home_controller.dart';
import 'package:rocketsoon/src/domain/rocket.dart';
import 'package:rocketsoon/src/ui/components/rocket_component.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box('db');
    final HomeController homeController = Get.find<HomeController>();

    return FutureBuilder(
      initialData: [],
      future: homeController.getAllRockets(),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<RocketModel> rockets = snapshot.data;

          var hasFavorites = rockets.firstWhereOrNull((rocket) {
            bool? storedState = box.get(rocket.id);

            if (storedState != null) {
              return storedState;
            }

            return false;
          });

          if (hasFavorites != null) {
            return _listOfRockets(rockets, box);
          }

          return _noFavoriteRocketsFound();
        }

        return SizedBox.expand(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget _noFavoriteRocketsFound() {
    return Container(
      child: Center(
        child: Text(
          'Oops, parece que ainda não há foguetes favoritos!',
        ),
      ),
    );
  }

  Widget _listOfRockets(List<RocketModel> rockets, Box box) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: rockets.length,
      itemBuilder: (_, index) {
        bool isFavorited = box.get(rockets[index].id) != null
            ? box.get(rockets[index].id)
            : false;

        if (isFavorited) {
          return Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: RocketComponent(
              rocket: rockets[index],
            ),
          );
        }

        return Container();
      },
    );
  }
}
