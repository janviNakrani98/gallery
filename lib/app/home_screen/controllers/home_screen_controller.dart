import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  int currentIndex = 0;

  int bottomSelectedIndex = 0;


  void pageChanged(int index) {
    bottomSelectedIndex = index;
    update();
  }

  void bottomTapped(int index) {
    bottomSelectedIndex = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
   update();
  }

  void onTabChange(index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    update();

  }

  void onPageChanged(int index) {
    currentIndex = index;
    update();

  }





}
