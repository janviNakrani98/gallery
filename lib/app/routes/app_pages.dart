import 'package:get/get.dart';

import '../folder/image_screen/bindings/image_screen_binding.dart';
import '../folder/image_screen/views/image_screen_view.dart';
import '../folder/video_screen/bindings/video_screen_binding.dart';
import '../folder/video_screen/views/video_screen_view.dart';
import '../folder/viewpage_screen/bindings/viewpage_screen_binding.dart';
import '../folder/viewpage_screen/views/viewpage_screen_view.dart';
import '../home_screen/bindings/home_screen_binding.dart';
import '../home_screen/views/home_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_SCREEN,
      page: () => const ImageScreenView(),
      binding: ImageScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_SCREEN,
      page: () => const VideoScreenView(),
      binding: VideoScreenBinding(),
    ),
    GetPage(
      name: _Paths.VIEWPAGE_SCREEN,
      page: () => const ViewpageScreenView(),
      binding: ViewpageScreenBinding(),
    ),
  ];
}
