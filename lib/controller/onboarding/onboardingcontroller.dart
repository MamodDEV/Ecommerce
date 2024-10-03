import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onpagechanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  MyServices myServices = Get.find();
  late PageController pageController;
  int currentIndex = 0;
  @override
  next() {
    currentIndex++;

    if (currentIndex > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString('step', '1');
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  onpagechanged(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
