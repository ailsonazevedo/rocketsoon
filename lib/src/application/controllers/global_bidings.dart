import 'package:get/get.dart';
import 'package:rocketsoon/src/application/controllers/wrapper_controller.dart';

class GlobalBiding implements Bindings {
  @override
  void dependencies() {
    Get.put<WrapperController>(WrapperController());
  }
}
