import 'package:flutter/material.dart';
import 'package:rocketsoon/src/application/services/spacex_api_service.dart';
import 'package:rocketsoon/src/domain/rocket.dart';
import 'package:rocketsoon/src/ui/components/rocket_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SpaceXAPI spaceXAPI = SpaceXAPI();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder(
        initialData: [],
        future: spaceXAPI.getAll(),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<RocketModel> rockets = snapshot.data;

            print(rockets);

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
      ),
    );
  }
}
