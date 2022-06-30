import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:rocketsoon/src/application/controllers/rocket_controller.dart';
import 'package:rocketsoon/src/domain/rocket.dart';
import 'package:rocketsoon/src/ui/view/rocket_detais.dart';

class RocketComponent extends StatelessWidget {
  final RocketModel rocket;

  const RocketComponent({
    Key? key,
    required this.rocket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box('db');
    bool favoritedStatus =
        box.get(rocket.id) != null ? box.get(rocket.id) : false;
    RocketController controller = RocketController(
      initialID: rocket.id,
      instance: box,
      initialFavoritedStatus: favoritedStatus,
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RocketDetails(
              rocket: rocket,
            ),
          ),
        );
      },
      child: Card(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${rocket.rocketName}",
                            style: Theme.of(context).textTheme.headline6),
                        Row(
                          children: [
                            Icon(Icons.home_work_outlined,
                              color: Colors.grey,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:6.0),
                              child: Text(rocket.company),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: rocket.flickrImages.first,
                      placeholder: (context, url) => SizedBox(
                        width: 200.0,
                        height: 150.0,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 6.0),
                  child: IconButton(
                    onPressed: controller.toggleFavorite,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    color: Colors.transparent,
                    icon: Obx(
                      () => Icon(
                        Icons.favorite,
                        color: controller.favorited.value
                            ? Colors.red
                            : Colors.grey,
                        size: 28.0,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
