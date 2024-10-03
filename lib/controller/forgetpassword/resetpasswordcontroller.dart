import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  changePassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  StatusRequest statusRequest = StatusRequest.none;
  late String email;

  late TextEditingController password;
  late TextEditingController repassword;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  @override
  changePassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning",
          middleText: "Passwords Does Not Match Please Enter Them Again !");
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await resetPasswordData.postData(email, password.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offAllNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Try Again Please !");
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }
}
