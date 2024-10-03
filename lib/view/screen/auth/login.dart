import 'package:ecommerce/controller/auth/logincontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerce/view/widget/auth/logoauth.dart';
import 'package:ecommerce/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '9'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: AppColor.grey),
          ),
        ),
        body: PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) async {
              if (!didPop) {
                alertExitApp();
              }
            },
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 35),
                          child: Form(
                            key: controller.formstate,
                            child: ListView(
                              children: [
                                const LogoAuth(),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextTitleAuth(text: "10".tr),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomTextBodyAuth(
                                  text: "11".tr,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                CustomTextFormAuth(
                                  isNumber: false,
                                  hinttext: '12'.tr,
                                  iconData: Icons.email_outlined,
                                  labeltext: "18".tr,
                                  mycontroller: controller.email,
                                  valid: (String? val) {
                                    return validInput(val!, 8, 30, 'email');
                                  },
                                ),
                                GetBuilder<LoginControllerImp>(
                                    builder: (controller) {
                                  return CustomTextFormAuth(
                                    obscureText: controller.isshowpass,
                                    onTapIcon: () {
                                      controller.showPassword();
                                    },
                                    isNumber: false,
                                    hinttext: '13'.tr,
                                    iconData: Icons.lock_outlined,
                                    labeltext: "19".tr,
                                    mycontroller: controller.password,
                                    valid: (String? val) {
                                      return validInput(
                                          val!, 8, 20, 'password');
                                    },
                                  );
                                }),
                                InkWell(
                                  onTap: () {
                                    controller.goToForgetPassword();
                                  },
                                  child: Text(
                                    '14'.tr,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                CustomButtonAuth(
                                  text: "15".tr,
                                  onpressed: () {
                                    controller.login();
                                  },
                                ),
                                SizedBox(
                                  height: Get.width / 8,
                                ),
                                CustomTextSignUpOrSignIn(
                                  textone: "16".tr,
                                  texttwo: '17'.tr,
                                  ontap: () {
                                    controller.goToSignUp();
                                  },
                                ),
                              ],
                            ),
                          )),
                    ))));
  }
}
