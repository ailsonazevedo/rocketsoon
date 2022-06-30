import 'package:get/get.dart';
import 'package:rocketsoon/src/application/services/spacex_api_service.dart';
import 'package:rocketsoon/src/domain/rocket.dart';

class HomeController extends GetxController {
  Future<List<RocketModel>> getAllRockets() async {
    return await SpaceXAPI().getAll();
  }
}
