import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1'.tr, style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLang(
              text: 'AR',
              onPressed: () {
                controller.changeLang('ar');
                Get.offAllNamed(AppRoute.onBoarding);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtonLang(
              text: 'EN',
              onPressed: () {
                controller.changeLang('en');
                Get.offAllNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
