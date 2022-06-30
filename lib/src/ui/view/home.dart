import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rocketsoon/src/application/controllers/home_controller.dart';
import 'package:rocketsoon/src/domain/rocket.dart';
import 'package:rocketsoon/src/ui/components/rocket_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return FutureBuilder(
      initialData: [],
      future: controller.getAllRockets(),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<RocketModel> rockets = snapshot.data;

          if (rockets.length == 0) {
            return Container(
              child: Center(
                child: Text(
                  'Oops, parece que ainda não temos foguetes por aqui! Estamos trabalhando nisso!',
                ),
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: rockets.length,
            itemBuilder: (_, index) {
              return Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: RocketComponent(
                  rocket: rockets[index],
                ),
              );
            },
          );
        }

        return SizedBox.expand(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
