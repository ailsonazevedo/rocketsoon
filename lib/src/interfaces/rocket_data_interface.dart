import 'package:rocketsoon/src/domain/rocket.dart';

abstract class RocketService {
  Future<List<RocketModel>> getAll();
}
