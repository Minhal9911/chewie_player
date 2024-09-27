
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController{
  late PageController pageController;
  late TabController tabController;

  final RxInt _currentPageIndex = 0.obs;
  int get currentPageIndex=>_currentPageIndex.value;

  void setPageIndex(int v){
    _currentPageIndex.value=v;
  }

  void setTabIndex(int v){
    tabController.index=v;
  }

  @override
  void dispose() {
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }
}