import 'package:ecommerce/controller/onboarding/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomSliderOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) => controller.onpagechanged(val),
        itemCount: onBoardingList.length,
        itemBuilder: ((context, index) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                onBoardingList[index].title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              onBoardingList[index].image!,
              width: Get.width / 1.8,
              height: Get.height / 3,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  fontSize: Get.width / 25,
                  color: AppColor.grey),
            ),
          ]);
        }));
  }
}
