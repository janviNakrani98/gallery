import 'dart:io';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:permission_handler/permission_handler.dart';
class VideoScreenController extends GetxController {

  List<Album>? albums;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    loading = true;
    initAsync();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      List<Album> albums1 = await PhotoGallery.listAlbums(
        mediumType: MediumType.video,
        newest: false,
        hideIfEmpty: false,
      );
      albums = albums1;
      loading = false;
      update();
    }

  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS) {
      if (await Permission.photos.request().isGranted || await Permission.storage.request().isGranted) {
        return true;
      }
    }
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted ||
          await Permission.photos.request().isGranted &&
              await Permission.videos.request().isGranted) {
        return true;
      }
    }
    return false;
  }


}
