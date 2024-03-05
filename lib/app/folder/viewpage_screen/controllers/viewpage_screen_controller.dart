import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';

class ViewpageScreenController extends GetxController {

  final count = 0.obs;

  List<Medium>? media;
  var mediumId;
  String? title ;
  String? title1;

  @override
  void onInit() {
    super.onInit();
    media = Get.arguments[0]['list'];
    mediumId = Get.arguments[1]['page_no'];
    title = Get.arguments[2]['file_name'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
