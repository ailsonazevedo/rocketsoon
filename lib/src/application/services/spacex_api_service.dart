import 'package:dio/dio.dart';
import 'package:rocketsoon/src/domain/rocket.dart';
import 'package:rocketsoon/src/interfaces/rocket_data_interface.dart';

class SpaceXAPI implements RocketService {
  late Dio _dio;
  static const String spaceXUri = 'https://api.spacexdata.com/v3';

  SpaceXAPI() {
    _dio = Dio();
  }

  @override
  Future<List<RocketModel>> getAll() async {
    List<RocketModel> rockets = [];
    String getAllUri = "$spaceXUri/rockets";

    Response response = await _dio.get(getAllUri);

    List<dynamic> body = response.data;

    if (response.statusCode == 200) {
      for (var rocket in body) {
        rockets.add(RocketModel.fromMap(rocket));
      }
    }

    return rockets;
  }
}
