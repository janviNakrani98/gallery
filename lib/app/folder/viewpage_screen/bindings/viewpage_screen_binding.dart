import 'package:get/get.dart';

import '../controllers/viewpage_screen_controller.dart';

class ViewpageScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewpageScreenController>(
      () => ViewpageScreenController(),
    );
  }
}
