import 'package:ecommerce/controller/auth/successsignupcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '17'.tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: AppColor.grey),
        ),
      ),
      body: Column(
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 200,
            color: Colors.green,
          ),
          Text('28'.tr),
          SizedBox(
            height: 40,
          ),
          Text("28".tr),
          const Spacer(),
          Container(
            width: double.infinity,
            child: CustomButtonAuth(
              text: "31".tr,
              onpressed: () {
                controller.goToLogin();
              },
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
