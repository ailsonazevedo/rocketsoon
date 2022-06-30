import 'package:get/get.dart';
import 'package:hive/hive.dart';

class RocketController extends GetxController {
  Box? db;
  final id = 0.obs;
  var favorited = false.obs;

  RocketController({
    required int initialID,
    required Box instance,
    required bool initialFavoritedStatus,
  }) {
    id.value = initialID;
    favorited.value = initialFavoritedStatus;
    db = instance;
  }

  toggleFavorite() async {
    favorited.value = !favorited.value;
    db?.put(id.value, favorited.value);
  }
}
