import 'package:get/get.dart';

class WrapperController extends GetxController {
  var page = 0.obs;

  changePage(int newPage) {
    page.value = newPage;
  }
}
