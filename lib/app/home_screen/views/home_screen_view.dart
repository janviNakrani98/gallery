import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/folder/image_screen/views/image_screen_view.dart';
import 'package:gallery/app/folder/video_screen/views/video_screen_view.dart';
import 'package:gallery/const/icon_path.dart';
import 'package:get/get.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
   HomeScreenView({Key? key}) : super(key: key);


   final iconList = [
     IconPath.image,
     IconPath.video,
   ];

   final iconSelectList = [
     IconPath.imageSelect,
     IconPath.videoSelect,
   ];

  @override
  Widget build(BuildContext context) {

    List<Widget>? widgetList = [
      ImageScreenView(),
      VideoScreenView(),
    ];

    List<BottomNavigationBarItem> buildBottomNavBarItems() {
      return [
        BottomNavigationBarItem(icon: new Icon(Icons.image), label:  'image'),
        BottomNavigationBarItem(icon: new Icon(Icons.video_camera_back), label:  'video'),
      ];
    }
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (context1) {
          return Scaffold(
            extendBody: true,
            body: SafeArea(
              child:  PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.pageChanged(index);
                },
                itemCount: widgetList.length,
                itemBuilder: (BuildContext context, int index) {
                  return widgetList[index];
                },
              ),
            ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.bottomSelectedIndex,
              selectedItemColor: Colors.pink,
              onTap: (index) {
                controller.bottomTapped(index);

              },
              items: buildBottomNavBarItems(),
            ),
          );
        });



  }



}
