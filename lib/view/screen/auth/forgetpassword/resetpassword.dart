import 'package:ecommerce/controller/forgetpassword/resetpasswordcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '14'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 35),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            const CustomTextTitleAuth(
                                text: "Set Your New Password"),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextBodyAuth(
                              text: "34".tr,
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              hinttext: '34'.tr,
                              iconData: Icons.lock_outlined,
                              labeltext: "35".tr,
                              mycontroller: controller.password,
                              valid: (String? val) {
                                return validInput(val!, 8, 20, 'password');
                              },
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              hinttext: '34'.tr,
                              iconData: Icons.lock_outlined,
                              labeltext: "35".tr,
                              mycontroller: controller.repassword,
                              valid: (String? val) {
                                return validInput(val!, 8, 20, 'password');
                              },
                            ),
                            CustomButtonAuth(
                              text: "33".tr,
                              onpressed: () {
                                controller.changePassword();
                              },
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                          ],
                        ),
                      )),
                )));
  }
}
