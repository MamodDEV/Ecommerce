import 'package:ecommerce/controller/forgetpassword/verifycodecontoller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  VerifyCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Verification Code'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 35),
                      child: ListView(
                        children: [
                          const CustomTextTitleAuth(text: "Check Code"),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextBodyAuth(
                            text:
                                "Please Check Inbox For The email : ${controller.email}",
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          OtpTextField(
                            numberOfFields: 5,
                            fieldWidth: 50,
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "Cairo"),
                            borderRadius: BorderRadius.circular(20),
                            borderColor: AppColor.primaryColor,
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,

                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.checkCode(verificationCode);
                            }, // end onSubmit
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      )),
                )));
  }
}
