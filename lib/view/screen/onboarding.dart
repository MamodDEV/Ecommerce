import 'package:ecommerce/controller/onboarding/onboardingcontroller.dart';
import 'package:ecommerce/view/widget/onboarding/custombutton.dart';
import 'package:ecommerce/view/widget/onboarding/customslider.dart';
import 'package:ecommerce/view/widget/onboarding/dotscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
////
  ///
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 3, child: CustomSliderOnBoarding()),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButtonOnBoarding()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
