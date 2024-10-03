import 'package:ecommerce/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
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
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 35),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            CustomTextTitleAuth(text: "27".tr),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextBodyAuth(
                              text: "29".tr,
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              hinttext: '12'.tr,
                              iconData: Icons.email_outlined,
                              labeltext: "18".tr,
                              mycontroller: controller.email,
                              valid: (String? val) {
                                return validInput(val!, 10, 40, "email");
                              },
                            ),
                            CustomButtonAuth(
                              text: "30".tr,
                              onpressed: () {
                                controller.checkEmail();
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
