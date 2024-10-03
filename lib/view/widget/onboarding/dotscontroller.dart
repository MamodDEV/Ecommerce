import 'package:ecommerce/controller/onboarding/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 400),
              width: controller.currentIndex == index ? 20 : 5,
              height: 6,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
