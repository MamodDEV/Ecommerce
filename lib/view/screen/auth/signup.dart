import 'package:ecommerce/controller/auth/signupcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:ecommerce/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        body: GetBuilder<SignUpControllerImp>(
          builder: (controller) {
            return PopScope(
                canPop: false,
                onPopInvoked: (bool didPop) async {
                  if (!didPop) {
                    alertExitApp();
                  }
                  print(didPop);
                },
                child: HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 35),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            CustomTextTitleAuth(text: "10".tr),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextBodyAuth(
                              text: "24".tr,
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (String? val) {
                                return validInput(val!, 8, 20, 'username');
                              },
                              hinttext: '23'.tr,
                              iconData: Icons.person_2_outlined,
                              labeltext: "20".tr,
                              mycontroller: controller.username,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              valid: (String? val) {
                                return validInput(val!, 8, 30, 'email');
                              },
                              hinttext: '12'.tr,
                              iconData: Icons.email_outlined,
                              labeltext: "18".tr,
                              mycontroller: controller.email,
                            ),
                            CustomTextFormAuth(
                              isNumber: true,
                              valid: (String? val) {
                                return validInput(val!, 8, 20, 'phone');
                              },
                              hinttext: '22'.tr,
                              iconData: Icons.phone_outlined,
                              labeltext: "21".tr,
                              mycontroller: controller.phone,
                            ),
                            CustomTextFormAuth(
                              obscureText: controller.isshowpass,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              isNumber: false,
                              valid: (String? val) {
                                return validInput(val!, 8, 20, 'password');
                              },
                              hinttext: '13'.tr,
                              iconData: Icons.lock_outlined,
                              labeltext: "19".tr,
                              mycontroller: controller.password,
                            ),
                            CustomButtonAuth(
                              text: "17".tr,
                              onpressed: () {
                                controller.signup();
                              },
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            CustomTextSignUpOrSignIn(
                                textone: "25".tr,
                                ontap: () {
                                  controller.goToLSignIn();
                                },
                                texttwo: "26".tr)
                          ],
                        ),
                      )),
                ));
          },
        ));
  }
}
